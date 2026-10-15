
# StockAdjustmentLinesInner


## Properties

Name | Type
------------ | -------------
`id` | string
`itemId` | string
`countedQuantity` | string
`systemQuantity` | string
`difference` | string
`unitCost` | string

## Example

```typescript
import type { StockAdjustmentLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "itemId": null,
  "countedQuantity": 1500000.00,
  "systemQuantity": 1500000.00,
  "difference": 1500000.00,
  "unitCost": 1500000.00,
} satisfies StockAdjustmentLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockAdjustmentLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


