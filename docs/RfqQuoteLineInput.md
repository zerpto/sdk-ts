
# RfqQuoteLineInput


## Properties

Name | Type
------------ | -------------
`rfqLineId` | string
`unitPrice` | string
`taxRateId` | string

## Example

```typescript
import type { RfqQuoteLineInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "rfqLineId": null,
  "unitPrice": 1500000.00,
  "taxRateId": null,
} satisfies RfqQuoteLineInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqQuoteLineInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


