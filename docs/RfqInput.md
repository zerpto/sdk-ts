
# RfqInput


## Properties

Name | Type
------------ | -------------
`rfqDate` | Date
`replyBy` | Date
`currency` | string
`notes` | string
`contactUserId` | string
`defaultRequiredDate` | Date
`defaultWarehouseId` | string
`paymentTermsDays` | number
`deliveryTerms` | string
`requestFreightBreakdown` | boolean
`groupBy` | string
`vendorIds` | Array&lt;string&gt;
`lines` | [Array&lt;RfqLineInput&gt;](RfqLineInput.md)

## Example

```typescript
import type { RfqInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "rfqDate": null,
  "replyBy": null,
  "currency": IDR,
  "notes": null,
  "contactUserId": null,
  "defaultRequiredDate": null,
  "defaultWarehouseId": null,
  "paymentTermsDays": null,
  "deliveryTerms": null,
  "requestFreightBreakdown": null,
  "groupBy": null,
  "vendorIds": null,
  "lines": null,
} satisfies RfqInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


