
# AgingReportTotals


## Properties

Name | Type
------------ | -------------
`current` | string
`days130` | string
`days3160` | string
`days6190` | string
`daysOver90` | string
`total` | string

## Example

```typescript
import type { AgingReportTotals } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "current": 1500000.00,
  "days130": 1500000.00,
  "days3160": 1500000.00,
  "days6190": 1500000.00,
  "daysOver90": 1500000.00,
  "total": 1500000.00,
} satisfies AgingReportTotals

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AgingReportTotals
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


