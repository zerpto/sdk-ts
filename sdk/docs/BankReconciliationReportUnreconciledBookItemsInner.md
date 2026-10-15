
# BankReconciliationReportUnreconciledBookItemsInner


## Properties

Name | Type
------------ | -------------
`type` | string
`id` | string
`date` | Date
`amount` | string
`description` | string

## Example

```typescript
import type { BankReconciliationReportUnreconciledBookItemsInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "type": null,
  "id": null,
  "date": null,
  "amount": 1500000.00,
  "description": null,
} satisfies BankReconciliationReportUnreconciledBookItemsInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankReconciliationReportUnreconciledBookItemsInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


