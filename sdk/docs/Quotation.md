
# Quotation


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`customerId` | string
`status` | string
`quoteDate` | Date
`validUntil` | Date
`currency` | string
`notes` | string
`lines` | [Array&lt;InvoiceLine&gt;](InvoiceLine.md)
`subtotal` | string
`taxTotal` | string
`total` | string
`salesOrderId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Quotation } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "customerId": null,
  "status": null,
  "quoteDate": null,
  "validUntil": null,
  "currency": IDR,
  "notes": null,
  "lines": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "salesOrderId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Quotation

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Quotation
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


