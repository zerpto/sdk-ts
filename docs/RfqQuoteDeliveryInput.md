
# RfqQuoteDeliveryInput


## Properties

Name | Type
------------ | -------------
`rfqDeliveryId` | string
`quantityOffered` | string
`warehouseId` | string
`promisedDate` | Date

## Example

```typescript
import type { RfqQuoteDeliveryInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "rfqDeliveryId": null,
  "quantityOffered": 1500000.00,
  "warehouseId": null,
  "promisedDate": null,
} satisfies RfqQuoteDeliveryInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqQuoteDeliveryInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


