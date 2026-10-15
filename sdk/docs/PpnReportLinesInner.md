
# PpnReportLinesInner


## Properties

Name | Type
------------ | -------------
`direction` | string
`documentType` | string
`documentId` | string
`number` | string
`date` | Date
`counterpartyName` | string
`counterpartyTaxId` | string
`dpp` | string
`ppn` | string

## Example

```typescript
import type { PpnReportLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "direction": null,
  "documentType": null,
  "documentId": null,
  "number": null,
  "date": null,
  "counterpartyName": null,
  "counterpartyTaxId": null,
  "dpp": 1500000.00,
  "ppn": 1500000.00,
} satisfies PpnReportLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PpnReportLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


