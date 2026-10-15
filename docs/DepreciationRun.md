
# DepreciationRun


## Properties

Name | Type
------------ | -------------
`id` | string
`periodId` | string
`status` | string
`assetCount` | number
`totalDepreciation` | string
`currency` | string
`journalEntryId` | string
`error` | string
`lines` | [Array&lt;DepreciationRunLinesInner&gt;](DepreciationRunLinesInner.md)
`createdAt` | Date

## Example

```typescript
import type { DepreciationRun } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "periodId": null,
  "status": null,
  "assetCount": null,
  "totalDepreciation": 1500000.00,
  "currency": IDR,
  "journalEntryId": null,
  "error": null,
  "lines": null,
  "createdAt": null,
} satisfies DepreciationRun

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as DepreciationRun
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


