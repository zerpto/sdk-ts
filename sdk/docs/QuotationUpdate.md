
# QuotationUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`customerId` | string
`quoteDate` | Date
`validUntil` | Date
`currency` | string
`notes` | string
`status` | string
`lines` | [Array&lt;InvoiceLineInput&gt;](InvoiceLineInput.md)

## Example

```typescript
import type { QuotationUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "customerId": null,
  "quoteDate": null,
  "validUntil": null,
  "currency": IDR,
  "notes": null,
  "status": null,
  "lines": null,
} satisfies QuotationUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as QuotationUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


