
# StockCard


## Properties

Name | Type
------------ | -------------
`itemId` | string
`startDate` | Date
`endDate` | Date
`openingQuantity` | string
`closingQuantity` | string
`lines` | [Array&lt;StockMovement&gt;](StockMovement.md)

## Example

```typescript
import type { StockCard } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "itemId": null,
  "startDate": null,
  "endDate": null,
  "openingQuantity": 1500000.00,
  "closingQuantity": 1500000.00,
  "lines": null,
} satisfies StockCard

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockCard
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


