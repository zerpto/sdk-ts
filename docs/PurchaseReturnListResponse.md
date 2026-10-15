
# PurchaseReturnListResponse


## Properties

Name | Type
------------ | -------------
`data` | [Array&lt;PurchaseReturn&gt;](PurchaseReturn.md)
`meta` | [PageListMeta](PageListMeta.md)

## Example

```typescript
import type { PurchaseReturnListResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies PurchaseReturnListResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchaseReturnListResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


