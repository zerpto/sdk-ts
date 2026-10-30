
# ReceiptLine

A line on a receipt-style document (Expense, Income) where the unit price is tax-included, as printed on the receipt.

## Properties

Name | Type
------------ | -------------
`id` | string
`description` | string
`itemId` | string
`warehouseId` | string
`accountId` | string
`quantity` | string
`unitPrice` | string
`taxRateId` | string
`lineSubtotal` | string
`lineTax` | string
`lineTotal` | string

## Example

```typescript
import type { ReceiptLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "description": null,
  "itemId": null,
  "warehouseId": null,
  "accountId": null,
  "quantity": 1500000.00,
  "unitPrice": 1500000.00,
  "taxRateId": null,
  "lineSubtotal": 1500000.00,
  "lineTax": 1500000.00,
  "lineTotal": 1500000.00,
} satisfies ReceiptLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReceiptLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


