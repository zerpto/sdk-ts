
# AssetRegisterLinesInner


## Properties

Name | Type
------------ | -------------
`assetId` | string
`code` | string
`name` | string
`categoryId` | string
`acquisitionDate` | Date
`cost` | string
`accumulatedDepreciation` | string
`netBookValue` | string
`status` | string

## Example

```typescript
import type { AssetRegisterLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "assetId": null,
  "code": null,
  "name": null,
  "categoryId": null,
  "acquisitionDate": null,
  "cost": 1500000.00,
  "accumulatedDepreciation": 1500000.00,
  "netBookValue": 1500000.00,
  "status": null,
} satisfies AssetRegisterLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetRegisterLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


