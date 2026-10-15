
# ArInvoiceInput


## Properties

Name | Type
------------ | -------------
`customerId` | string
`invoiceDate` | Date
`dueDate` | Date
`currency` | string
`notes` | string
`lines` | [Array&lt;InvoiceLineInput&gt;](InvoiceLineInput.md)

## Example

```typescript
import type { ArInvoiceInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "customerId": null,
  "invoiceDate": null,
  "dueDate": null,
  "currency": IDR,
  "notes": null,
  "lines": null,
} satisfies ArInvoiceInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ArInvoiceInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


