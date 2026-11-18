
# RfqComparisonLine


## Properties

Name | Type
------------ | -------------
`rfqLineId` | string
`description` | string
`quantity` | string
`offers` | [Array&lt;RfqComparisonOffer&gt;](RfqComparisonOffer.md)

## Example

```typescript
import type { RfqComparisonLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "rfqLineId": null,
  "description": null,
  "quantity": 1500000.00,
  "offers": null,
} satisfies RfqComparisonLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqComparisonLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


