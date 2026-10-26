
# ArPaymentInput

Sum of allocations must not exceed amount.

## Properties

Name | Type
------------ | -------------
`customerId` | string
`paymentDate` | Date
`currency` | string
`amount` | string
`method` | string
`reference` | string
`cashAccountId` | string
`allocations` | [Array&lt;PaymentAllocation&gt;](PaymentAllocation.md)

## Example

```typescript
import type { ArPaymentInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "customerId": null,
  "paymentDate": null,
  "currency": IDR,
  "amount": 1500000.00,
  "method": null,
  "reference": null,
  "cashAccountId": null,
  "allocations": null,
} satisfies ArPaymentInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ArPaymentInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


