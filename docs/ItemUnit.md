
# ItemUnit

An alternative unit of an item, such as a box of 12 pieces. `factor` says how many base units one of it holds, so quantities and stock stay in the base unit. `factor` is a decimal string greater than zero. `sales_price` and `purchase_price` are for one of this unit, and a price left out is the base price times `factor`. The unit name must differ from the base unit and from the other units of the item. 

## Properties

Name | Type
------------ | -------------
`unit` | string
`factor` | string
`salesPrice` | [Money](Money.md)
`purchasePrice` | [Money](Money.md)

## Example

```typescript
import type { ItemUnit } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "unit": box,
  "factor": 1500000.00,
  "salesPrice": null,
  "purchasePrice": null,
} satisfies ItemUnit

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ItemUnit
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


