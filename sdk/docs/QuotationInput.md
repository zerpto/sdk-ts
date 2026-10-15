
# QuotationInput


## Properties

Name | Type
------------ | -------------
`customerId` | string
`quoteDate` | Date
`validUntil` | Date
`currency` | string
`notes` | string
`lines` | [Array&lt;InvoiceLineInput&gt;](InvoiceLineInput.md)

## Example

```typescript
import type { QuotationInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "customerId": null,
  "quoteDate": null,
  "validUntil": null,
  "currency": IDR,
  "notes": null,
  "lines": null,
} satisfies QuotationInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as QuotationInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


