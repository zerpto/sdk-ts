# How to use @zerpto/sdk

## Install

The package builds itself on install (`"prepare": "npm run build"`).

```bash
# from GitHub
npm install github:zerpto/sdk-ts

# or from a local path
npm install /work/zerpto/sdk-ts
```

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
