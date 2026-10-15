
# PurchaseReturnInput


## Properties

Name | Type
------------ | -------------
`goodsReceiptId` | string
`returnDate` | Date
`notes` | string
`lines` | [Array&lt;PurchaseReturnInputLinesInner&gt;](PurchaseReturnInputLinesInner.md)

## Example

```typescript
import type { PurchaseReturnInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "goodsReceiptId": null,
  "returnDate": null,
  "notes": null,
  "lines": null,
} satisfies PurchaseReturnInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchaseReturnInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


