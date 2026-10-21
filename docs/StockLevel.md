
# StockLevel


## Properties

Name | Type
------------ | -------------
`item` | [Item](Item.md)
`warehouse` | [Warehouse](Warehouse.md)
`quantity` | string
`averageCost` | string
`value` | string

## Example

```typescript
import type { StockLevel } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "item": null,
  "warehouse": null,
  "quantity": 1500000.00,
  "averageCost": 1500000.00,
  "value": 1500000.00,
} satisfies StockLevel

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as StockLevel
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


