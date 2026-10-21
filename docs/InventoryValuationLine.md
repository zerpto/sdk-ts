
# InventoryValuationLine


## Properties

Name | Type
------------ | -------------
`itemId` | string
`warehouseId` | string
`quantity` | string
`averageCost` | string
`value` | string

## Example

```typescript
import type { InventoryValuationLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "itemId": null,
  "warehouseId": null,
  "quantity": 1500000.00,
  "averageCost": 1500000.00,
  "value": 1500000.00,
} satisfies InventoryValuationLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as InventoryValuationLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


