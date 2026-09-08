#!/usr/bin/env bash
# check-links.sh
# Verify every internal link in the built Hugo site.
#
# Usage: bash .github/scripts/check-links.sh <baseURL> [publicDir]
#
# This deliberately does NOT rely on the theme's link render hook. That hook
# skips any destination beginning with "/" -- which is exactly the
# absolute-logical-path style this repo's content uses -- so it can never warn
# about our links. Checking the built output is what actually catches a dead one.
#
# Two independent checks:
#
#   A. Every root-relative href/src must carry the site's base path. Hugo's link
#      render hook rewrites a link to .RelPermalink (which includes the base
#      path) only when .Page.GetPage resolves it; an unresolvable link is
#      emitted verbatim. A missing base path is therefore the signal for a dead
#      link. This also catches the relURL trap: a shortcode href written as
#      "/templates/x.xlsx" keeps its leading slash, loses the base path, and
#      404s on the deployed site.
#
#   B. Every base-path link must resolve to a file on disk.
set -euo pipefail

BASE_URL="${1:-}"
PUBLIC="${2:-public}"

# With no argument, fall back to the site's configured baseURL. This makes the
# script usable locally as `bash .github/scripts/check-links.sh`.
if [ -z "$BASE_URL" ] && command -v hugo >/dev/null 2>&1; then
  BASE_URL=$(hugo config | sed -nE "s/^baseurl = '(.*)'$/\1/p")
fi

if [ -z "$BASE_URL" ]; then
  echo "::error::usage: check-links.sh <baseURL> [publicDir]"
  exit 2
fi
if [ ! -d "$PUBLIC" ]; then
  echo "::error::'$PUBLIC' is not a directory - build the site first."
  exit 2
fi

# https://host/sub/ -> /sub   (empty for a root-hosted site)
BASE_PATH=$(printf '%s' "$BASE_URL" | sed -E 's#^https?://[^/]+##; s#/+$##')
echo "base path: '${BASE_PATH:-<root>}'"

# ---- check A: every root-relative URL carries the base path ------------------
if [ -n "$BASE_PATH" ]; then
  rooted=$( { grep -roh -E '(href|src)="?/[^"'"'"' >]*' "$PUBLIC" --include='*.html' || true; } \
    | sed -E 's/^(href|src)="?//' | sort -u )
  orphans=$(printf '%s\n' "$rooted" | { grep -v -E "^${BASE_PATH}(/|$)" || true; } | { grep -v '^$' || true; })
  orphan_count=$(printf '%s' "$orphans" | { grep -c . || true; })
  echo "root-relative URLs without the base path : $orphan_count"
  if [ "$orphan_count" -ne 0 ]; then
    echo "::error::$orphan_count internal URL(s) do not carry the base path '$BASE_PATH'."
    echo "Hugo emits a link verbatim when it cannot resolve it, so these are dead links,"
    echo "or shortcode href/url params written with a leading slash."
    printf '%s\n' "$orphans" | sed 's/^/  /'
    exit 1
  fi
else
  echo "root-hosted site: skipping the base-path check"
fi

# ---- check B: every base-path link resolves on disk --------------------------
links=$( { grep -roh -E "href=\"?${BASE_PATH}/[^\"' >]*" "$PUBLIC" --include='*.html' || true; } \
  | sed -E 's/^href="?//' | sort -u )

total=0
missing=0
while IFS= read -r url; do
  [ -n "$url" ] || continue
  total=$((total + 1))
  rel=${url#"${BASE_PATH}"/}
  rel=${rel%%#*}
  rel=${rel%%\?*}
  rel=${rel%/}
  [ -n "$rel" ] || continue
  if [ -e "$PUBLIC/$rel" ] || [ -e "$PUBLIC/$rel/index.html" ]; then
    continue
  fi
  echo "  MISSING: $url"
  missing=$((missing + 1))
done <<EOF
$links
EOF

echo "internal links checked : $total"
echo "dead links             : $missing"

# A scan that finds almost nothing has itself broken; fail rather than pass
# vacuously.
if [ "$total" -lt 50 ]; then
  echo "::error::Only $total internal links found - the link scan itself is broken."
  exit 1
fi
if [ "$missing" -ne 0 ]; then
  echo "::error::$missing internal link(s) point at a page that was not built."
  exit 1
fi
echo "Links OK: $total checked, 0 dead, 0 missing the base path."
