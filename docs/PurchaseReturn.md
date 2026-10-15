
# PurchaseReturn


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`goodsReceiptId` | string
`purchaseOrderId` | string
`vendorId` | string
`warehouseId` | string
`returnDate` | Date
`status` | string
`notes` | string
`lines` | [Array&lt;PurchaseReturnLine&gt;](PurchaseReturnLine.md)
`creditNoteId` | string
`journalEntryId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { PurchaseReturn } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "goodsReceiptId": null,
  "purchaseOrderId": null,
  "vendorId": null,
  "warehouseId": null,
  "returnDate": null,
  "status": null,
  "notes": null,
  "lines": null,
  "creditNoteId": null,
  "journalEntryId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies PurchaseReturn

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchaseReturn
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


