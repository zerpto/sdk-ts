
# RfqQuoteDelivery

The vendor\'s answer to one requested delivery, or a placeholder when it did not answer.

## Properties

Name | Type
------------ | -------------
`id` | string
`rfqDeliveryId` | string
`quantityOffered` | string
`warehouseId` | string
`promisedDate` | Date
`quantityVariance` | string
`daysLate` | number
`notQuoted` | boolean

## Example

```typescript
import type { RfqQuoteDelivery } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "rfqDeliveryId": null,
  "quantityOffered": null,
  "warehouseId": null,
  "promisedDate": null,
  "quantityVariance": null,
  "daysLate": null,
  "notQuoted": null,
} satisfies RfqQuoteDelivery

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqQuoteDelivery
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


