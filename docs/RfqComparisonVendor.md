
# RfqComparisonVendor


## Properties

Name | Type
------------ | -------------
`quoteId` | string
`vendorId` | string
`deliveryTerms` | string
`leadTimeDays` | number
`linesOffered` | number
`total` | string
`freightCost` | string
`freightBundled` | boolean
`freightNotStated` | boolean
`landedCostExcludesBuyerTransport` | boolean
`totalLanded` | string
`isLowestTotal` | boolean

## Example

```typescript
import type { RfqComparisonVendor } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "quoteId": null,
  "vendorId": null,
  "deliveryTerms": null,
  "leadTimeDays": null,
  "linesOffered": null,
  "total": 1500000.00,
  "freightCost": null,
  "freightBundled": null,
  "freightNotStated": null,
  "landedCostExcludesBuyerTransport": null,
  "totalLanded": 1500000.00,
  "isLowestTotal": null,
} satisfies RfqComparisonVendor

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqComparisonVendor
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


