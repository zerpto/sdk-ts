
# RfqComparisonDeliveryOffer


## Properties

Name | Type
------------ | -------------
`quoteId` | string
`notQuoted` | boolean
`quantityOffered` | string
`warehouseId` | string
`promisedDate` | Date
`estimated` | boolean
`quantityVariance` | string
`daysLate` | number

## Example

```typescript
import type { RfqComparisonDeliveryOffer } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "quoteId": null,
  "notQuoted": null,
  "quantityOffered": null,
  "warehouseId": null,
  "promisedDate": null,
  "estimated": null,
  "quantityVariance": null,
  "daysLate": null,
} satisfies RfqComparisonDeliveryOffer

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqComparisonDeliveryOffer
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


