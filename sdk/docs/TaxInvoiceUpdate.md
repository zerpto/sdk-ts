
# TaxInvoiceUpdate


## Properties

Name | Type
------------ | -------------
`taxInvoiceNumber` | string
`issuedDate` | Date

## Example

```typescript
import type { TaxInvoiceUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "taxInvoiceNumber": null,
  "issuedDate": null,
} satisfies TaxInvoiceUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxInvoiceUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


