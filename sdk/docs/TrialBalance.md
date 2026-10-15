
# TrialBalance


## Properties

Name | Type
------------ | -------------
`asOf` | Date
`currency` | string
`rows` | [Array&lt;TrialBalanceRowsInner&gt;](TrialBalanceRowsInner.md)
`totalDebit` | string
`totalCredit` | string

## Example

```typescript
import type { TrialBalance } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "asOf": null,
  "currency": IDR,
  "rows": null,
  "totalDebit": 1500000.00,
  "totalCredit": 1500000.00,
} satisfies TrialBalance

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TrialBalance
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


