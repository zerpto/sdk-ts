
# StockTransfer


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`fromWarehouseId` | string
`toWarehouseId` | string
`date` | Date
`status` | string
`lines` | [Array&lt;StockTransferLinesInner&gt;](StockTransferLinesInner.md)
`createdAt` | Date

## Example

```typescript
import type { StockTransfer } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "fromWarehouseId": null,
  "toWarehouseId": null,
  "date": null,
  "status": null,
  "lines": null,
  "createdAt": null,
} satisfies StockTransfer

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockTransfer
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


