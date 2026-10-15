
# BankReconciliationReport


## Properties

Name | Type
------------ | -------------
`reconciliationId` | string
`bankAccountId` | string
`periodStart` | Date
`periodEnd` | Date
`statementBalance` | string
`bookBalance` | string
`difference` | string
`unmatchedStatementLines` | [Array&lt;BankStatementLine&gt;](BankStatementLine.md)
`unreconciledBookItems` | [Array&lt;BankReconciliationReportUnreconciledBookItemsInner&gt;](BankReconciliationReportUnreconciledBookItemsInner.md)

## Example

```typescript
import type { BankReconciliationReport } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "reconciliationId": null,
  "bankAccountId": null,
  "periodStart": null,
  "periodEnd": null,
  "statementBalance": 1500000.00,
  "bookBalance": 1500000.00,
  "difference": 1500000.00,
  "unmatchedStatementLines": null,
  "unreconciledBookItems": null,
} satisfies BankReconciliationReport

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankReconciliationReport
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


