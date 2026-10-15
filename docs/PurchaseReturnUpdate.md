
# PurchaseReturnUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`returnDate` | Date
`notes` | string
`lines` | [Array&lt;PurchaseReturnInputLinesInner&gt;](PurchaseReturnInputLinesInner.md)

## Example

```typescript
import type { PurchaseReturnUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "returnDate": null,
  "notes": null,
  "lines": null,
} satisfies PurchaseReturnUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchaseReturnUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


