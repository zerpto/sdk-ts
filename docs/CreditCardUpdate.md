
# CreditCardUpdate

All fields optional; only those sent are changed. The linked ledger account and the currency cannot be changed.

## Properties

Name | Type
------------ | -------------
`name` | string
`bankName` | string
`cardNumber` | string
`creditLimit` | string
`status` | string

## Example

```typescript
import type { CreditCardUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "bankName": null,
  "cardNumber": null,
  "creditLimit": 1500000.00,
  "status": null,
} satisfies CreditCardUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreditCardUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


