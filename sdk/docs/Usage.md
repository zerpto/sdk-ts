
# Usage


## Properties

Name | Type
------------ | -------------
`periodStart` | Date
`periodEnd` | Date
`requestCount` | number
`rateLimit` | [UsageRateLimit](UsageRateLimit.md)

## Example

```typescript
import type { Usage } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "periodStart": null,
  "periodEnd": null,
  "requestCount": null,
  "rateLimit": null,
} satisfies Usage

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Usage
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


