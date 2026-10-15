
# AssetCategory


## Properties

Name | Type
------------ | -------------
`id` | string
`name` | string
`depreciationMethod` | string
`usefulLifeMonths` | number
`decliningRate` | string
`assetAccountId` | string
`accumulatedDepreciationAccountId` | string
`depreciationExpenseAccountId` | string
`status` | string
`createdAt` | Date

## Example

```typescript
import type { AssetCategory } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "name": null,
  "depreciationMethod": null,
  "usefulLifeMonths": null,
  "decliningRate": 1500000.00,
  "assetAccountId": null,
  "accumulatedDepreciationAccountId": null,
  "depreciationExpenseAccountId": null,
  "status": null,
  "createdAt": null,
} satisfies AssetCategory

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetCategory
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


