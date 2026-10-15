
# AgingReport


## Properties

Name | Type
------------ | -------------
`asOf` | Date
`currency` | string
`rows` | [Array&lt;AgingReportRowsInner&gt;](AgingReportRowsInner.md)
`totals` | [AgingReportTotals](AgingReportTotals.md)

## Example

```typescript
import type { AgingReport } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "asOf": null,
  "currency": IDR,
  "rows": null,
  "totals": null,
} satisfies AgingReport

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AgingReport
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


