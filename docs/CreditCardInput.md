
# CreditCardInput


## Properties

Name | Type
------------ | -------------
`name` | string
`bankName` | string
`cardNumber` | string
`currency` | string
`creditLimit` | string
`glAccountId` | string

## Example

```typescript
import type { CreditCardInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "bankName": null,
  "cardNumber": null,
  "currency": IDR,
  "creditLimit": 1500000.00,
  "glAccountId": null,
} satisfies CreditCardInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreditCardInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


