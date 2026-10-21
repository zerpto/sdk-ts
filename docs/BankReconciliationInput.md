
# BankReconciliationInput


## Properties

Name | Type
------------ | -------------
`bankAccountId` | string
`periodStart` | Date
`periodEnd` | Date
`statementId` | string

## Example

```typescript
import type { BankReconciliationInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "bankAccountId": null,
  "periodStart": null,
  "periodEnd": null,
  "statementId": null,
} satisfies BankReconciliationInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankReconciliationInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


