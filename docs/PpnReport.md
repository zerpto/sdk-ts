
# PpnReport


## Properties

Name | Type
------------ | -------------
`startDate` | Date
`endDate` | Date
`currency` | string
`outputDpp` | string
`outputPpn` | string
`inputDpp` | string
`inputPpn` | string
`netPayable` | string
`lines` | [Array&lt;PpnReportLinesInner&gt;](PpnReportLinesInner.md)

## Example

```typescript
import type { PpnReport } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "startDate": null,
  "endDate": null,
  "currency": IDR,
  "outputDpp": 1500000.00,
  "outputPpn": 1500000.00,
  "inputDpp": 1500000.00,
  "inputPpn": 1500000.00,
  "netPayable": 1500000.00,
  "lines": null,
} satisfies PpnReport

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PpnReport
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


