
# AssetUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`name` | string
`categoryId` | string
`salvageValue` | string
`usefulLifeMonths` | number
`location` | string

## Example

```typescript
import type { AssetUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "categoryId": null,
  "salvageValue": 1500000.00,
  "usefulLifeMonths": null,
  "location": null,
} satisfies AssetUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


