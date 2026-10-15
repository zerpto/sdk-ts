
# TaxInvoice


## Properties

Name | Type
------------ | -------------
`id` | string
`arInvoiceId` | string
`taxInvoiceNumber` | string
`date` | Date
`customerId` | string
`customerName` | string
`customerTaxId` | string
`dpp` | string
`ppn` | string
`currency` | string
`status` | string
`exportId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { TaxInvoice } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "arInvoiceId": null,
  "taxInvoiceNumber": null,
  "date": null,
  "customerId": null,
  "customerName": null,
  "customerTaxId": null,
  "dpp": 1500000.00,
  "ppn": 1500000.00,
  "currency": IDR,
  "status": null,
  "exportId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies TaxInvoice

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxInvoice
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


