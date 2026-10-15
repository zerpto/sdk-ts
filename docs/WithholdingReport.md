
# WithholdingReport


## Properties

Name | Type
------------ | -------------
`startDate` | Date
`endDate` | Date
`currency` | string
`totalBase` | string
`totalWithheld` | string
`lines` | [Array&lt;WithholdingReportLinesInner&gt;](WithholdingReportLinesInner.md)

## Example

```typescript
import type { WithholdingReport } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "startDate": null,
  "endDate": null,
  "currency": IDR,
  "totalBase": 1500000.00,
  "totalWithheld": 1500000.00,
  "lines": null,
} satisfies WithholdingReport

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WithholdingReport
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


