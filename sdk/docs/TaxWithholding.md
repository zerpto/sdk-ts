
# TaxWithholding


## Properties

Name | Type
------------ | -------------
`id` | string
`apInvoiceId` | string
`vendorId` | string
`taxRateId` | string
`withholdingDate` | Date
`baseAmount` | string
`amount` | string
`currency` | string
`certificateNumber` | string
`journalEntryId` | string
`createdAt` | Date

## Example

```typescript
import type { TaxWithholding } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "apInvoiceId": null,
  "vendorId": null,
  "taxRateId": null,
  "withholdingDate": null,
  "baseAmount": 1500000.00,
  "amount": 1500000.00,
  "currency": IDR,
  "certificateNumber": null,
  "journalEntryId": null,
  "createdAt": null,
} satisfies TaxWithholding

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxWithholding
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


