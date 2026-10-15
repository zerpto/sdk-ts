
# BankAccount


## Properties

Name | Type
------------ | -------------
`id` | string
`name` | string
`bankName` | string
`accountNumber` | string
`currency` | string
`glAccountId` | string
`status` | string
`createdAt` | Date

## Example

```typescript
import type { BankAccount } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "name": null,
  "bankName": null,
  "accountNumber": null,
  "currency": IDR,
  "glAccountId": null,
  "status": null,
  "createdAt": null,
} satisfies BankAccount

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankAccount
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


