
# DepreciationSchedule


## Properties

Name | Type
------------ | -------------
`assetId` | string
`currency` | string
`lines` | [Array&lt;DepreciationScheduleLinesInner&gt;](DepreciationScheduleLinesInner.md)

## Example

```typescript
import type { DepreciationSchedule } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "assetId": null,
  "currency": IDR,
  "lines": null,
} satisfies DepreciationSchedule

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as DepreciationSchedule
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


