
# Quotation

A quotation you give a customer. It can answer a request for quotation: then it carries the request reference, the delivery places and dates, and your freight and delivery terms. Totals cover only the lines and quantities you offered.

## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`customerId` | string
`status` | string
`quoteDate` | Date
`validUntil` | Date
`currency` | string
`notes` | string
`rfqNumber` | string
`rfqDate` | Date
`rfqReplyBy` | Date
`paymentTermsDays` | number
`deliveryTerms` | string
`leadTimeDays` | number
`sampleAvailable` | boolean
`sampleNote` | string
`freightCost` | string
`freightIncludedInPrice` | boolean
`freightTaxIncluded` | boolean
`freightTaxRateId` | string
`lines` | [Array&lt;QuotationLine&gt;](QuotationLine.md)
`freightNetTotal` | string
`freightTaxTotal` | string
`subtotal` | string
`taxTotal` | string
`total` | string
`totalLanded` | string
`salesOrderId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Quotation } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "customerId": null,
  "status": null,
  "quoteDate": null,
  "validUntil": null,
  "currency": IDR,
  "notes": null,
  "rfqNumber": null,
  "rfqDate": null,
  "rfqReplyBy": null,
  "paymentTermsDays": null,
  "deliveryTerms": null,
  "leadTimeDays": null,
  "sampleAvailable": null,
  "sampleNote": null,
  "freightCost": null,
  "freightIncludedInPrice": null,
  "freightTaxIncluded": null,
  "freightTaxRateId": null,
  "lines": null,
  "freightNetTotal": null,
  "freightTaxTotal": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "totalLanded": 1500000.00,
  "salesOrderId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Quotation

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Quotation
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


