
# TenantSession

A new token pair scoped to a tenant, with a summary of that tenant. Returned when switching tenant and when creating one.

## Properties

Name | Type
------------ | -------------
`accessToken` | string
`refreshToken` | string
`tokenType` | string
`expiresIn` | number
`tenant` | [TenantSummary](TenantSummary.md)

## Example

```typescript
import type { TenantSession } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "accessToken": null,
  "refreshToken": null,
  "tokenType": null,
  "expiresIn": 900,
  "tenant": null,
} satisfies TenantSession

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TenantSession
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


