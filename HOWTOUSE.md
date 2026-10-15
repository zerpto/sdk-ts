# How to use @zerpto/sdk

## Install

The package builds itself on install (`"prepare": "npm run build"`).

```bash
# from GitHub
npm install github:zerpto/sdk-ts

# or from a local path
npm install /work/zerpto/sdk-ts
```

### Pinning a version

npm accepts any git ref after the `#`:

```bash
npm install github:zerpto/sdk-ts#<full-commit-hash>   # immutable, recommended until tags exist
npm install github:zerpto/sdk-ts#v1.0.0               # tag, once released
npm install github:zerpto/sdk-ts#main                 # branch; moves over time (same as no ref)
```

A commit hash always gives the same code. Get the current one with `git rev-parse HEAD`. Prefer the full 40-character hash.

### Getting updates

A consuming project does not learn about new commits by itself. `package-lock.json` records the exact commit it installed, and that commit is used until someone updates it.

- Hash or tag: change the ref in `package.json` (or re-run `npm install github:zerpto/sdk-ts#<new-ref>`), then commit the lockfile.
- Branch: run `npm update @zerpto/sdk` to move to the latest commit, then commit the lockfile.

To release a version, bump `version` in `package.json`, commit, then create a tag (`git tag v1.1.0`). Consumers can then install `#v1.1.0`.

## Use

```ts
import { Configuration, APIKeysApi } from "@zerpto/sdk";

const config = new Configuration({
  basePath: "https://api.zerpto.com",       // default, can be omitted
  accessToken: process.env.ZERPTO_API_KEY,  // sent as Authorization: Bearer
});

const api = new APIKeysApi(config);
const usage = await api.getUsage();         // responses are { data, meta }
```

Every API class and method is listed in the table in [README.md](README.md) and documented in [docs/](docs/).

## Notes

- **Auth:** the generated README example sets `accessToken` twice, once for `ApiKeyAuth` and once for `UserJWT`. Use only one. Public API clients use the tenant API key.
- **Internal operations:** the SDK is generated from the full spec, so operations marked `x-visibility: internal` (web app only) are included. Public API clients should not use them.
- **Idempotency:** POST endpoints that create or post financial records expect an `Idempotency-Key` header. Pass it through `initOverrides` or a middleware on `Configuration`.
- **Errors:** error responses are `{ error: { code, message, field, request_id } }`. Branch on `code`.

## Regenerate

The spec is downloaded with HTTP basic auth and is not committed (`spec/` is in `.gitignore`).

```bash
curl -u <user>:<password> -o spec/openapi.yaml https://docs.zerpto.my.id/api/openapi.yaml
npx @openapitools/openapi-generator-cli generate -i spec/openapi.yaml -g typescript-fetch -o . \
  --additional-properties=npmName=@zerpto/sdk,npmVersion=1.0.0,supportsES6=true,typescriptThreePlus=true
npm run build
```
