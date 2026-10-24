
# GoodsReceipt


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`purchaseOrderIds` | Array&lt;string&gt;
`purchaseOrders` | [Array&lt;PurchaseOrder&gt;](PurchaseOrder.md)
`vendorId` | string
`vendor` | [BusinessPartner](BusinessPartner.md)
`warehouseId` | string
`warehouse` | [Warehouse](Warehouse.md)
`receivedDate` | Date
`status` | string
`billingStatus` | string
`billId` | string
`lines` | [Array&lt;GoodsReceiptLine&gt;](GoodsReceiptLine.md)
`deliveryNote` | [FileAttachment](FileAttachment.md)
`evidences` | [Array&lt;GoodsReceiptEvidence&gt;](GoodsReceiptEvidence.md)
`journalEntryId` | string
`createdAt` | Date

## Example

```typescript
import type { GoodsReceipt } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "purchaseOrderIds": null,
  "purchaseOrders": null,
  "vendorId": null,
  "vendor": null,
  "warehouseId": null,
  "warehouse": null,
  "receivedDate": null,
  "status": null,
  "billingStatus": null,
  "billId": null,
  "lines": null,
  "deliveryNote": null,
  "evidences": null,
  "journalEntryId": null,
  "createdAt": null,
} satisfies GoodsReceipt

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as GoodsReceipt
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


