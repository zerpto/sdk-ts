
# BalanceSheet


## Properties

Name | Type
------------ | -------------
`asOf` | Date
`currency` | string
`assets` | [Array&lt;ReportSection&gt;](ReportSection.md)
`liabilities` | [Array&lt;ReportSection&gt;](ReportSection.md)
`equity` | [Array&lt;ReportSection&gt;](ReportSection.md)
`totalAssets` | string
`totalLiabilitiesAndEquity` | string

## Example

```typescript
import type { BalanceSheet } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "asOf": null,
  "currency": IDR,
  "assets": null,
  "liabilities": null,
  "equity": null,
  "totalAssets": 1500000.00,
  "totalLiabilitiesAndEquity": 1500000.00,
} satisfies BalanceSheet

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BalanceSheet
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


