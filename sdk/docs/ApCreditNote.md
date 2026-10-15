
# ApCreditNote


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`vendorId` | string
`vendorCreditNoteNumber` | string
`status` | string
`creditNoteDate` | Date
`currency` | string
`reason` | string
`apInvoiceId` | string
`purchaseReturnId` | string
`documentId` | string
`notes` | string
`lines` | [Array&lt;InvoiceLine&gt;](InvoiceLine.md)
`subtotal` | string
`taxTotal` | string
`total` | string
`unappliedAmount` | string
`allocations` | [Array&lt;PaymentAllocation&gt;](PaymentAllocation.md)
`refunds` | [Array&lt;ApCreditNoteRefund&gt;](ApCreditNoteRefund.md)
`journalEntryId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { ApCreditNote } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "vendorId": null,
  "vendorCreditNoteNumber": null,
  "status": null,
  "creditNoteDate": null,
  "currency": IDR,
  "reason": null,
  "apInvoiceId": null,
  "purchaseReturnId": null,
  "documentId": null,
  "notes": null,
  "lines": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "unappliedAmount": 1500000.00,
  "allocations": null,
  "refunds": null,
  "journalEntryId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies ApCreditNote

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApCreditNote
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


