
# PurchaseOrderLine


## Properties

Name | Type
------------ | -------------
`id` | string
`itemId` | string
`receiptLineId` | string
`description` | string
`quantity` | string
`unitPrice` | string
`taxRateId` | string
`accountId` | string
`lineSubtotal` | string
`lineTax` | string
`lineTotal` | string
`receivedQuantity` | string
`billedQuantity` | string

## Example

```typescript
import type { PurchaseOrderLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "itemId": null,
  "receiptLineId": null,
  "description": null,
  "quantity": 1500000.00,
  "unitPrice": 1500000.00,
  "taxRateId": null,
  "accountId": null,
  "lineSubtotal": 1500000.00,
  "lineTax": 1500000.00,
  "lineTotal": 1500000.00,
  "receivedQuantity": 1500000.00,
  "billedQuantity": 1500000.00,
} satisfies PurchaseOrderLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchaseOrderLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


