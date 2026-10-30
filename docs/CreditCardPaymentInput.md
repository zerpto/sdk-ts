
# CreditCardPaymentInput


## Properties

Name | Type
------------ | -------------
`creditCardId` | string
`cashAccountId` | string
`amount` | string
`currency` | string
`paymentDate` | Date
`reference` | string
`notes` | string

## Example

```typescript
import type { CreditCardPaymentInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "creditCardId": null,
  "cashAccountId": null,
  "amount": 1500000.00,
  "currency": IDR,
  "paymentDate": null,
  "reference": null,
  "notes": null,
} satisfies CreditCardPaymentInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreditCardPaymentInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


