
# BillFromPurchaseOrderInput


## Properties

Name | Type
------------ | -------------
`invoiceDate` | Date
`dueDate` | Date
`vendorInvoiceNumber` | string
`receiptIds` | Array&lt;string&gt;
`documentId` | string
`applyDownPayments` | boolean

## Example

```typescript
import type { BillFromPurchaseOrderInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "invoiceDate": null,
  "dueDate": null,
  "vendorInvoiceNumber": null,
  "receiptIds": null,
  "documentId": null,
  "applyDownPayments": null,
} satisfies BillFromPurchaseOrderInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BillFromPurchaseOrderInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


