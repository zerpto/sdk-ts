
# RfqComparisonOffer


## Properties

Name | Type
------------ | -------------
`quoteId` | string
`unitPriceAtRequestedQty` | string
`lineNetTotal` | string
`belowMoq` | boolean
`isLowest` | boolean

## Example

```typescript
import type { RfqComparisonOffer } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "quoteId": null,
  "unitPriceAtRequestedQty": 1500000.00,
  "lineNetTotal": 1500000.00,
  "belowMoq": null,
  "isLowest": null,
} satisfies RfqComparisonOffer

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqComparisonOffer
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


