
# UsageRateLimit


## Properties

Name | Type
------------ | -------------
`limit` | number
`remaining` | number
`resetAt` | Date

## Example

```typescript
import type { UsageRateLimit } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "limit": null,
  "remaining": null,
  "resetAt": null,
} satisfies UsageRateLimit

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UsageRateLimit
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


