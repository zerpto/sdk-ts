
# QuotationDelivery

What you offer for one delivery of a quotation line: where it goes, what the buyer asked for and what you promise. A delivery you decline stays in the list with `not_quoted: true`.

## Properties

Name | Type
------------ | -------------
`id` | string
`shipToName` | string
`shipToAddress` | string
`requestedQuantity` | string
`requestedDate` | Date
`quantityOffered` | string
`promisedDate` | Date
`quantityVariance` | string
`daysLate` | number
`notQuoted` | boolean

## Example

```typescript
import type { QuotationDelivery } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "shipToName": null,
  "shipToAddress": null,
  "requestedQuantity": null,
  "requestedDate": null,
  "quantityOffered": null,
  "promisedDate": null,
  "quantityVariance": null,
  "daysLate": null,
  "notQuoted": null,
} satisfies QuotationDelivery

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as QuotationDelivery
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


