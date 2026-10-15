
# StockAdjustmentInputLinesInner


## Properties

Name | Type
------------ | -------------
`itemId` | string
`countedQuantity` | string

## Example

```typescript
import type { StockAdjustmentInputLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "itemId": null,
  "countedQuantity": 1500000.00,
} satisfies StockAdjustmentInputLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockAdjustmentInputLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


