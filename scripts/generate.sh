#!/usr/bin/env bash
# Fetch the latest OpenAPI spec and regenerate the TypeScript SDK in the repo root.
#
# Credentials are read from the environment, or from a git-ignored .env file:
#   ZERPTO_SPEC_USER=...
#   ZERPTO_SPEC_PASSWORD=...
# Optional: ZERPTO_SPEC_URL overrides the spec location.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

: "${ZERPTO_SPEC_USER:?Set ZERPTO_SPEC_USER (env or .env)}"
: "${ZERPTO_SPEC_PASSWORD:?Set ZERPTO_SPEC_PASSWORD (env or .env)}"
SPEC_URL="${ZERPTO_SPEC_URL:-https://docs.zerpto.my.id/api/openapi.yaml}"
SPEC_FILE="spec/openapi.yaml"
TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE"' EXIT

mkdir -p spec

echo "==> Fetching spec from $SPEC_URL"
# Credentials go through a curl config on stdin, so they never appear in the process list.
printf 'user = "%s:%s"\n' "$ZERPTO_SPEC_USER" "$ZERPTO_SPEC_PASSWORD" \
  | curl --fail --silent --show-error --config - --output "$TMP_FILE" "$SPEC_URL"
mv "$TMP_FILE" "$SPEC_FILE"

echo "==> Generating SDK (typescript-fetch)"
npx --yes @openapitools/openapi-generator-cli generate \
  -i "$SPEC_FILE" \
  -g typescript-fetch \
  -o . \
  --additional-properties=npmName=@zerpto/sdk,npmVersion=1.0.0,supportsES6=true,typescriptThreePlus=true

echo "==> Building"
rm -rf dist
npm run build

echo "==> Done"
