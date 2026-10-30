
# PaymentSource

Where the money for a payment or expense came from. Exactly one of `cash_account_id` and `credit_card_id` is set.

## Properties

Name | Type
------------ | -------------
`cashAccountId` | string
`creditCardId` | string

## Example

```typescript
import type { PaymentSource } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "cashAccountId": null,
  "creditCardId": null,
} satisfies PaymentSource

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PaymentSource
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


