
# BillingInvoice


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`date` | Date
`total` | [Money](Money.md)
`status` | string
`pdfUrl` | string

## Example

```typescript
import type { BillingInvoice } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "date": null,
  "total": null,
  "status": null,
  "pdfUrl": null,
} satisfies BillingInvoice

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BillingInvoice
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


