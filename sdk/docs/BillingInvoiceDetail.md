
# BillingInvoiceDetail


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`date` | Date
`total` | [Money](Money.md)
`status` | string
`pdfUrl` | string
`periodStart` | Date
`periodEnd` | Date
`dueDate` | Date
`currency` | string
`subtotal` | string
`taxTotal` | string
`lines` | [Array&lt;BillingInvoiceLine&gt;](BillingInvoiceLine.md)
`paidAt` | Date

## Example

```typescript
import type { BillingInvoiceDetail } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "date": null,
  "total": null,
  "status": null,
  "pdfUrl": null,
  "periodStart": null,
  "periodEnd": null,
  "dueDate": null,
  "currency": IDR,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "lines": null,
  "paidAt": null,
} satisfies BillingInvoiceDetail

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BillingInvoiceDetail
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


