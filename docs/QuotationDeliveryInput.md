
# QuotationDeliveryInput


## Properties

Name | Type
------------ | -------------
`shipToName` | string
`shipToAddress` | string
`requestedQuantity` | string
`requestedDate` | Date
`notQuoted` | boolean
`quantityOffered` | string
`promisedDate` | Date

## Example

```typescript
import type { QuotationDeliveryInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "shipToName": null,
  "shipToAddress": null,
  "requestedQuantity": null,
  "requestedDate": null,
  "notQuoted": null,
  "quantityOffered": null,
  "promisedDate": null,
} satisfies QuotationDeliveryInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as QuotationDeliveryInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


