
# RfqQuoteUpdate

All fields optional; only those sent are changed. The vendor cannot be changed.

## Properties

Name | Type
------------ | -------------
`quoteDate` | Date
`validUntil` | Date
`leadTimeDays` | number
`deliveryTerms` | string
`notes` | string
`freightCost` | string
`freightIncludedInPrice` | boolean
`freightTaxIncluded` | boolean
`freightTaxRateId` | string
`lines` | [Array&lt;RfqQuoteLineInput&gt;](RfqQuoteLineInput.md)

## Example

```typescript
import type { RfqQuoteUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "quoteDate": null,
  "validUntil": null,
  "leadTimeDays": null,
  "deliveryTerms": null,
  "notes": null,
  "freightCost": null,
  "freightIncludedInPrice": null,
  "freightTaxIncluded": null,
  "freightTaxRateId": null,
  "lines": null,
} satisfies RfqQuoteUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqQuoteUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


