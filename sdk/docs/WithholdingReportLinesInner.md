
# WithholdingReportLinesInner


## Properties

Name | Type
------------ | -------------
`withholdingId` | string
`vendorId` | string
`vendorName` | string
`vendorTaxId` | string
`withholdingDate` | Date
`baseAmount` | string
`amount` | string
`certificateNumber` | string

## Example

```typescript
import type { WithholdingReportLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "withholdingId": null,
  "vendorId": null,
  "vendorName": null,
  "vendorTaxId": null,
  "withholdingDate": null,
  "baseAmount": 1500000.00,
  "amount": 1500000.00,
  "certificateNumber": null,
} satisfies WithholdingReportLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WithholdingReportLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


