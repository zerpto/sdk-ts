
# CashTransferInput


## Properties

Name | Type
------------ | -------------
`fromCashAccountId` | string
`toCashAccountId` | string
`amount` | string
`currency` | string
`transferDate` | Date
`reference` | string
`notes` | string

## Example

```typescript
import type { CashTransferInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "fromCashAccountId": null,
  "toCashAccountId": null,
  "amount": 1500000.00,
  "currency": IDR,
  "transferDate": null,
  "reference": null,
  "notes": null,
} satisfies CashTransferInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CashTransferInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


