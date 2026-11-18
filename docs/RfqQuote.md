
# RfqQuote

One vendor\'s reply to a request. Totals cover only the lines and quantities the vendor offered.

## Properties

Name | Type
------------ | -------------
`id` | string
`rfqId` | string
`vendorId` | string
`status` | string
`quoteDate` | Date
`validUntil` | Date
`leadTimeDays` | number
`deliveryTerms` | string
`notes` | string
`lines` | [Array&lt;RfqQuoteLine&gt;](RfqQuoteLine.md)
`linesOffered` | number
`freightCost` | string
`freightIncludedInPrice` | boolean
`freightTaxIncluded` | boolean
`freightTaxRateId` | string
`freightNetTotal` | string
`freightTaxTotal` | string
`subtotal` | string
`taxTotal` | string
`total` | string
`totalLanded` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { RfqQuote } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "rfqId": null,
  "vendorId": null,
  "status": null,
  "quoteDate": null,
  "validUntil": null,
  "leadTimeDays": null,
  "deliveryTerms": null,
  "notes": null,
  "lines": null,
  "linesOffered": null,
  "freightCost": null,
  "freightIncludedInPrice": null,
  "freightTaxIncluded": null,
  "freightTaxRateId": null,
  "freightNetTotal": null,
  "freightTaxTotal": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "totalLanded": 1500000.00,
  "createdAt": null,
  "updatedAt": null,
} satisfies RfqQuote

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqQuote
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


