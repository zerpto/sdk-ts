
# BillingPayment


## Properties

Name | Type
------------ | -------------
`id` | string
`invoiceId` | string
`amount` | [Money](Money.md)
`method` | string
`channel` | string
`source` | string
`status` | string
`gatewayPaymentId` | string
`createdAt` | Date
`paidAt` | Date

## Example

```typescript
import type { BillingPayment } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "invoiceId": null,
  "amount": null,
  "method": null,
  "channel": OVO,
  "source": null,
  "status": null,
  "gatewayPaymentId": null,
  "createdAt": null,
  "paidAt": null,
} satisfies BillingPayment

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BillingPayment
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


