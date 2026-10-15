
# ApPaymentInput

Sum of allocations must not exceed amount; any remainder stays as an unallocated balance. A payment is not tied to one bill: one payment can pay several bills with different amounts (for example 70%, 20% and 10% of the payment), each allocation an amount in `allocations`. 

## Properties

Name | Type
------------ | -------------
`vendorId` | string
`paymentDate` | Date
`currency` | string
`amount` | string
`method` | string
`reference` | string
`bankAccountId` | string
`purchaseOrderId` | string
`allocations` | [Array&lt;PaymentAllocation&gt;](PaymentAllocation.md)

## Example

```typescript
import type { ApPaymentInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorId": null,
  "paymentDate": null,
  "currency": IDR,
  "amount": 1500000.00,
  "method": null,
  "reference": null,
  "bankAccountId": null,
  "purchaseOrderId": null,
  "allocations": null,
} satisfies ApPaymentInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApPaymentInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


