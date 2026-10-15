
# PurchaseOrder


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`vendorId` | string
`status` | string
`orderDate` | Date
`expectedDate` | Date
`currency` | string
`notes` | string
`lines` | [Array&lt;PurchaseOrderLine&gt;](PurchaseOrderLine.md)
`subtotal` | string
`taxTotal` | string
`total` | string
`downPaymentPaid` | string
`downPaymentBalance` | string
`approvalId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { PurchaseOrder } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "vendorId": null,
  "status": null,
  "orderDate": null,
  "expectedDate": null,
  "currency": IDR,
  "notes": null,
  "lines": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "downPaymentPaid": 1500000.00,
  "downPaymentBalance": 1500000.00,
  "approvalId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies PurchaseOrder

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PurchaseOrder
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


