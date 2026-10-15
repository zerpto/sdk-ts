
# BillingInvoiceLine


## Properties

Name | Type
------------ | -------------
`description` | string
`quantity` | string
`unitPrice` | string
`amount` | string

## Example

```typescript
import type { BillingInvoiceLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "description": null,
  "quantity": 1500000.00,
  "unitPrice": 1500000.00,
  "amount": 1500000.00,
} satisfies BillingInvoiceLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BillingInvoiceLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


