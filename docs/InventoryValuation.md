
# InventoryValuation


## Properties

Name | Type
------------ | -------------
`asOf` | Date
`currency` | string
`total` | string
`lines` | [Array&lt;InventoryValuationLine&gt;](InventoryValuationLine.md)

## Example

```typescript
import type { InventoryValuation } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "asOf": null,
  "currency": IDR,
  "total": 1500000.00,
  "lines": null,
} satisfies InventoryValuation

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as InventoryValuation
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


