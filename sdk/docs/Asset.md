
# Asset


## Properties

Name | Type
------------ | -------------
`id` | string
`code` | string
`name` | string
`categoryId` | string
`status` | string
`acquisitionDate` | Date
`acquisitionCost` | string
`salvageValue` | string
`usefulLifeMonths` | number
`depreciationMethod` | string
`decliningRate` | string
`depreciationStartDate` | Date
`accumulatedDepreciation` | string
`netBookValue` | string
`currency` | string
`location` | string
`apInvoiceId` | string
`apInvoiceLineId` | string
`disposal` | [AssetDisposal](AssetDisposal.md)
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Asset } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "code": null,
  "name": null,
  "categoryId": null,
  "status": null,
  "acquisitionDate": null,
  "acquisitionCost": 1500000.00,
  "salvageValue": 1500000.00,
  "usefulLifeMonths": null,
  "depreciationMethod": null,
  "decliningRate": 1500000.00,
  "depreciationStartDate": null,
  "accumulatedDepreciation": 1500000.00,
  "netBookValue": 1500000.00,
  "currency": IDR,
  "location": null,
  "apInvoiceId": null,
  "apInvoiceLineId": null,
  "disposal": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Asset

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Asset
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


