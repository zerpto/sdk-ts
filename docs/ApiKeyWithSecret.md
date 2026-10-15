
# ApiKeyWithSecret


## Properties

Name | Type
------------ | -------------
`id` | string
`name` | string
`mode` | string
`prefix` | string
`last4` | string
`createdAt` | Date
`lastUsedAt` | Date
`revokedAt` | Date
`secret` | string

## Example

```typescript
import type { ApiKeyWithSecret } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "name": null,
  "mode": null,
  "prefix": erp_live_,
  "last4": null,
  "createdAt": null,
  "lastUsedAt": null,
  "revokedAt": null,
  "secret": null,
} satisfies ApiKeyWithSecret

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApiKeyWithSecret
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


