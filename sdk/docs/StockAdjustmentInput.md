
# StockAdjustmentInput


## Properties

Name | Type
------------ | -------------
`warehouseId` | string
`date` | Date
`reason` | string
`adjustmentAccountId` | string
`lines` | [Array&lt;StockAdjustmentInputLinesInner&gt;](StockAdjustmentInputLinesInner.md)

## Example

```typescript
import type { StockAdjustmentInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "warehouseId": null,
  "date": null,
  "reason": null,
  "adjustmentAccountId": null,
  "lines": null,
} satisfies StockAdjustmentInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockAdjustmentInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


