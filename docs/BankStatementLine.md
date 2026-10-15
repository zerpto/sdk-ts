
# BankStatementLine


## Properties

Name | Type
------------ | -------------
`id` | string
`statementId` | string
`date` | Date
`description` | string
`reference` | string
`amount` | string
`matchStatus` | string
`matches` | [Array&lt;BankMatch&gt;](BankMatch.md)

## Example

```typescript
import type { BankStatementLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "statementId": null,
  "date": null,
  "description": null,
  "reference": null,
  "amount": 1500000.00,
  "matchStatus": null,
  "matches": null,
} satisfies BankStatementLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankStatementLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


