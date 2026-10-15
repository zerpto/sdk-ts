
# ApCreditNoteUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`vendorCreditNoteNumber` | string
`creditNoteDate` | Date
`reason` | string
`documentId` | string
`notes` | string
`lines` | [Array&lt;InvoiceLineInput&gt;](InvoiceLineInput.md)

## Example

```typescript
import type { ApCreditNoteUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorCreditNoteNumber": null,
  "creditNoteDate": null,
  "reason": null,
  "documentId": null,
  "notes": null,
  "lines": null,
} satisfies ApCreditNoteUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApCreditNoteUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


