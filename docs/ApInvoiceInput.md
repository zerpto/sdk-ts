
# ApInvoiceInput


## Properties

Name | Type
------------ | -------------
`vendorId` | string
`vendorInvoiceNumber` | string
`invoiceDate` | Date
`dueDate` | Date
`currency` | string
`notes` | string
`applyDownPayments` | boolean
`documentId` | string
`lines` | [Array&lt;InvoiceLineInput&gt;](InvoiceLineInput.md)

## Example

```typescript
import type { ApInvoiceInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorId": null,
  "vendorInvoiceNumber": null,
  "invoiceDate": null,
  "dueDate": null,
  "currency": IDR,
  "notes": null,
  "applyDownPayments": null,
  "documentId": null,
  "lines": null,
} satisfies ApInvoiceInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApInvoiceInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


