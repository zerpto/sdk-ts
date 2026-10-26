
# CashTransfer


## Properties

Name | Type
------------ | -------------
`id` | string
`fromCashAccountId` | string
`toCashAccountId` | string
`amount` | string
`currency` | string
`transferDate` | Date
`reference` | string
`notes` | string
`status` | string
`journalEntryId` | string
`createdAt` | Date

## Example

```typescript
import type { CashTransfer } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "fromCashAccountId": null,
  "toCashAccountId": null,
  "amount": 1500000.00,
  "currency": IDR,
  "transferDate": null,
  "reference": null,
  "notes": null,
  "status": null,
  "journalEntryId": null,
  "createdAt": null,
} satisfies CashTransfer

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CashTransfer
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


