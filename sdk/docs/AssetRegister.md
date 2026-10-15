
# AssetRegister


## Properties

Name | Type
------------ | -------------
`asOf` | Date
`currency` | string
`totalCost` | string
`totalAccumulatedDepreciation` | string
`totalNetBookValue` | string
`lines` | [Array&lt;AssetRegisterLinesInner&gt;](AssetRegisterLinesInner.md)

## Example

```typescript
import type { AssetRegister } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "asOf": null,
  "currency": IDR,
  "totalCost": 1500000.00,
  "totalAccumulatedDepreciation": 1500000.00,
  "totalNetBookValue": 1500000.00,
  "lines": null,
} satisfies AssetRegister

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetRegister
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


