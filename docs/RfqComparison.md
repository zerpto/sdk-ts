
# RfqComparison

The quotes of a request lined up by request line, then by delivery, with one entry per vendor in the same order as `vendors`. Every quote is comparable: `is_lowest_total` ranks on `total_landed`, so check `quantity_variance` and `not_quoted` before choosing.

## Properties

Name | Type
------------ | -------------
`rfqId` | string
`currency` | string
`vendors` | [Array&lt;RfqComparisonVendor&gt;](RfqComparisonVendor.md)
`lines` | [Array&lt;RfqComparisonLine&gt;](RfqComparisonLine.md)

## Example

```typescript
import type { RfqComparison } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "rfqId": null,
  "currency": IDR,
  "vendors": null,
  "lines": null,
} satisfies RfqComparison

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqComparison
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


