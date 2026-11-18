
# RfqQuoteInput


## Properties

Name | Type
------------ | -------------
`vendorId` | string
`quoteDate` | Date
`validUntil` | Date
`leadTimeDays` | number
`notes` | string
`lines` | [Array&lt;RfqQuoteLineInput&gt;](RfqQuoteLineInput.md)

## Example

```typescript
import type { RfqQuoteInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorId": null,
  "quoteDate": null,
  "validUntil": null,
  "leadTimeDays": null,
  "notes": null,
  "lines": null,
} satisfies RfqQuoteInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqQuoteInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


