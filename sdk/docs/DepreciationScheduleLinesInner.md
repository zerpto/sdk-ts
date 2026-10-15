
# DepreciationScheduleLinesInner


## Properties

Name | Type
------------ | -------------
`periodStart` | Date
`periodEnd` | Date
`depreciation` | string
`accumulatedDepreciation` | string
`netBookValue` | string
`status` | string
`journalEntryId` | string

## Example

```typescript
import type { DepreciationScheduleLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "periodStart": null,
  "periodEnd": null,
  "depreciation": 1500000.00,
  "accumulatedDepreciation": 1500000.00,
  "netBookValue": 1500000.00,
  "status": null,
  "journalEntryId": null,
} satisfies DepreciationScheduleLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as DepreciationScheduleLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


