
# PurchasingSettingsUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`quantityTolerancePercent` | string
`priceTolerancePercent` | string
`grniAccountId` | string
`varianceAccountId` | string
`vendorAdvanceAccountId` | string

## Example

```typescript
import type { PurchasingSettingsUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "quantityTolerancePercent": 1500000.00,
  "priceTolerancePercent": 1500000.00,
  "grniAccountId": null,
  "varianceAccountId": null,
  "vendorAdvanceAccountId": null,
} satisfies PurchasingSettingsUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchasingSettingsUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


