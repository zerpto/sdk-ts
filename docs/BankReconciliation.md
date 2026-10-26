
# BankReconciliation


## Properties

Name | Type
------------ | -------------
`id` | string
`cashAccountId` | string
`periodStart` | Date
`periodEnd` | Date
`statementBalance` | string
`bookBalance` | string
`difference` | string
`status` | string
`completedAt` | Date
`createdAt` | Date

## Example

```typescript
import type { BankReconciliation } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "cashAccountId": null,
  "periodStart": null,
  "periodEnd": null,
  "statementBalance": 1500000.00,
  "bookBalance": 1500000.00,
  "difference": 1500000.00,
  "status": null,
  "completedAt": null,
  "createdAt": null,
} satisfies BankReconciliation

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankReconciliation
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


