
# ApInvoice


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`vendorId` | string
`vendorInvoiceNumber` | string
`status` | string
`invoiceDate` | Date
`dueDate` | Date
`currency` | string
`notes` | string
`lines` | [Array&lt;InvoiceLine&gt;](InvoiceLine.md)
`subtotal` | string
`taxTotal` | string
`total` | string
`amountDue` | string
`journalEntryId` | string
`receiptIds` | Array&lt;string&gt;
`documentId` | string
`applyDownPayments` | boolean
`matchStatus` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { ApInvoice } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "vendorId": null,
  "vendorInvoiceNumber": null,
  "status": null,
  "invoiceDate": null,
  "dueDate": null,
  "currency": IDR,
  "notes": null,
  "lines": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "amountDue": 1500000.00,
  "journalEntryId": null,
  "receiptIds": null,
  "documentId": null,
  "applyDownPayments": null,
  "matchStatus": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies ApInvoice

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApInvoice
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


