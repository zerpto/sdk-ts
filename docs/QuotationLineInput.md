
# QuotationLineInput


## Properties

Name | Type
------------ | -------------
`itemId` | string
`description` | string
`specification` | string
`unit` | string
`rfqItemNo` | number
`alternativeForItemNo` | number
`accountId` | string
`quantity` | string
`unitPrice` | string
`taxRateId` | string
`taxIncluded` | boolean
`moq` | string
`leadTimeDays` | number
`priceBreaks` | [Array&lt;RfqPriceBreakInput&gt;](RfqPriceBreakInput.md)
`deliveries` | [Array&lt;QuotationDeliveryInput&gt;](QuotationDeliveryInput.md)

## Example

```typescript
import type { QuotationLineInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "itemId": null,
  "description": null,
  "specification": null,
  "unit": null,
  "rfqItemNo": null,
  "alternativeForItemNo": null,
  "accountId": null,
  "quantity": 1500000.00,
  "unitPrice": null,
  "taxRateId": null,
  "taxIncluded": null,
  "moq": null,
  "leadTimeDays": null,
  "priceBreaks": null,
  "deliveries": null,
} satisfies QuotationLineInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as QuotationLineInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


