
# Membership


## Properties

Name | Type
------------ | -------------
`id` | string
`tenant` | [TenantSummary](TenantSummary.md)
`isActive` | boolean

## Example

```typescript
import type { Membership } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": mem-0191a8c2-7b3e-7c1d-9a52-4f6e8d2b1c07,
  "tenant": null,
  "isActive": null,
} satisfies Membership

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Membership
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


