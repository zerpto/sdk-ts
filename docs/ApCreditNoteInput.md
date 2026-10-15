
# ApCreditNoteInput


## Properties

Name | Type
------------ | -------------
`vendorId` | string
`vendorCreditNoteNumber` | string
`creditNoteDate` | Date
`currency` | string
`reason` | string
`apInvoiceId` | string
`purchaseReturnId` | string
`documentId` | string
`notes` | string
`lines` | [Array&lt;InvoiceLineInput&gt;](InvoiceLineInput.md)

## Example

```typescript
import type { ApCreditNoteInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorId": null,
  "vendorCreditNoteNumber": null,
  "creditNoteDate": null,
  "currency": IDR,
  "reason": null,
  "apInvoiceId": null,
  "purchaseReturnId": null,
  "documentId": null,
  "notes": null,
  "lines": null,
} satisfies ApCreditNoteInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApCreditNoteInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


