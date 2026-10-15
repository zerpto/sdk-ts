
# InvoiceFromSalesOrderInput


## Properties

Name | Type
------------ | -------------
`invoiceDate` | Date
`dueDate` | Date
`deliveryIds` | Array&lt;string&gt;

## Example

```typescript
import type { InvoiceFromSalesOrderInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "invoiceDate": null,
  "dueDate": null,
  "deliveryIds": null,
} satisfies InvoiceFromSalesOrderInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as InvoiceFromSalesOrderInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


