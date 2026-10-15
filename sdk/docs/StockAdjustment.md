
# StockAdjustment


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`warehouseId` | string
`date` | Date
`reason` | string
`status` | string
`adjustmentAccountId` | string
`lines` | [Array&lt;StockAdjustmentLinesInner&gt;](StockAdjustmentLinesInner.md)
`journalEntryId` | string
`createdAt` | Date

## Example

```typescript
import type { StockAdjustment } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "warehouseId": null,
  "date": null,
  "reason": null,
  "status": null,
  "adjustmentAccountId": null,
  "lines": null,
  "journalEntryId": null,
  "createdAt": null,
} satisfies StockAdjustment

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockAdjustment
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


