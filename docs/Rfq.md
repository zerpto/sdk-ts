
# Rfq

A request for quotation, sent to several vendors to price the same lines.

## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`status` | string
`rfqDate` | Date
`replyBy` | Date
`currency` | string
`notes` | string
`contactUserId` | string
`requiredDate` | Date
`warehouseId` | string
`paymentTermsDays` | number
`deliveryTerms` | string
`contactUser` | [AuthUser](AuthUser.md)
`vendorIds` | Array&lt;string&gt;
`lines` | [Array&lt;RfqLine&gt;](RfqLine.md)
`quotes` | [Array&lt;RfqQuote&gt;](RfqQuote.md)
`awardedQuoteId` | string
`purchaseOrderId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Rfq } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "status": null,
  "rfqDate": null,
  "replyBy": null,
  "currency": IDR,
  "notes": null,
  "contactUserId": null,
  "requiredDate": null,
  "warehouseId": null,
  "paymentTermsDays": null,
  "deliveryTerms": null,
  "contactUser": null,
  "vendorIds": null,
  "lines": null,
  "quotes": null,
  "awardedQuoteId": null,
  "purchaseOrderId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Rfq

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Rfq
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


