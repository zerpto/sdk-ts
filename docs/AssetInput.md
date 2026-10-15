
# AssetInput


## Properties

Name | Type
------------ | -------------
`code` | string
`name` | string
`categoryId` | string
`acquisitionDate` | Date
`acquisitionCost` | string
`salvageValue` | string
`usefulLifeMonths` | number
`depreciationMethod` | string
`decliningRate` | string
`depreciationStartDate` | Date
`openingAccumulatedDepreciation` | string
`location` | string

## Example

```typescript
import type { AssetInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "code": null,
  "name": null,
  "categoryId": null,
  "acquisitionDate": null,
  "acquisitionCost": 1500000.00,
  "salvageValue": 1500000.00,
  "usefulLifeMonths": null,
  "depreciationMethod": null,
  "decliningRate": 1500000.00,
  "depreciationStartDate": null,
  "openingAccumulatedDepreciation": 1500000.00,
  "location": null,
} satisfies AssetInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


