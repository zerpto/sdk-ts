
# TrialBalanceRowsInner


## Properties

Name | Type
------------ | -------------
`accountId` | string
`code` | string
`name` | string
`debit` | string
`credit` | string

## Example

```typescript
import type { TrialBalanceRowsInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "accountId": null,
  "code": null,
  "name": null,
  "debit": 1500000.00,
  "credit": 1500000.00,
} satisfies TrialBalanceRowsInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TrialBalanceRowsInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


