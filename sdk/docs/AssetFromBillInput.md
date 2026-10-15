
# AssetFromBillInput


## Properties

Name | Type
------------ | -------------
`apInvoiceId` | string
`lineId` | string
`categoryId` | string
`name` | string
`code` | string
`salvageValue` | string
`depreciationStartDate` | Date
`location` | string

## Example

```typescript
import type { AssetFromBillInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "apInvoiceId": null,
  "lineId": null,
  "categoryId": null,
  "name": null,
  "code": null,
  "salvageValue": 1500000.00,
  "depreciationStartDate": null,
  "location": null,
} satisfies AssetFromBillInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetFromBillInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


