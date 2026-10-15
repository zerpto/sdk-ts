
# TaxWithholdingInput


## Properties

Name | Type
------------ | -------------
`apInvoiceId` | string
`taxRateId` | string
`baseAmount` | string
`withholdingDate` | Date
`certificateNumber` | string

## Example

```typescript
import type { TaxWithholdingInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "apInvoiceId": null,
  "taxRateId": null,
  "baseAmount": 1500000.00,
  "withholdingDate": null,
  "certificateNumber": null,
} satisfies TaxWithholdingInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxWithholdingInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


