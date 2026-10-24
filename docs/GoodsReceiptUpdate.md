
# GoodsReceiptUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`vendorId` | string
`warehouseId` | string
`receivedDate` | Date
`lines` | [Array&lt;GoodsReceiptInputLinesInner&gt;](GoodsReceiptInputLinesInner.md)

## Example

```typescript
import type { GoodsReceiptUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorId": null,
  "warehouseId": null,
  "receivedDate": null,
  "lines": null,
} satisfies GoodsReceiptUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as GoodsReceiptUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


