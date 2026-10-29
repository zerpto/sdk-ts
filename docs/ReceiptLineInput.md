
# ReceiptLineInput

The line total, tax and subtotal are worked out by the server and returned on the line.

## Properties

Name | Type
------------ | -------------
`description` | string
`itemId` | string
`accountId` | string
`quantity` | string
`unitPrice` | string
`taxRateId` | string

## Example

```typescript
import type { ReceiptLineInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "description": null,
  "itemId": null,
  "accountId": null,
  "quantity": 1500000.00,
  "unitPrice": 1500000.00,
  "taxRateId": null,
} satisfies ReceiptLineInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReceiptLineInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


