
# StockMovement


## Properties

Name | Type
------------ | -------------
`id` | string
`itemId` | string
`warehouseId` | string
`date` | Date
`type` | string
`quantity` | string
`unitCost` | string
`value` | string
`runningQuantity` | string
`sourceType` | string
`sourceId` | string

## Example

```typescript
import type { StockMovement } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "itemId": null,
  "warehouseId": null,
  "date": null,
  "type": null,
  "quantity": 1500000.00,
  "unitCost": 1500000.00,
  "value": 1500000.00,
  "runningQuantity": 1500000.00,
  "sourceType": null,
  "sourceId": null,
} satisfies StockMovement

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockMovement
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


