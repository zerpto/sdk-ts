
# SalesOrder


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`customerId` | string
`status` | string
`orderDate` | Date
`deliveryDate` | Date
`currency` | string
`notes` | string
`quotationId` | string
`lines` | [Array&lt;SalesOrderLine&gt;](SalesOrderLine.md)
`subtotal` | string
`taxTotal` | string
`total` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { SalesOrder } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "customerId": null,
  "status": null,
  "orderDate": null,
  "deliveryDate": null,
  "currency": IDR,
  "notes": null,
  "quotationId": null,
  "lines": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "createdAt": null,
  "updatedAt": null,
} satisfies SalesOrder

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SalesOrder
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


