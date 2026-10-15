
# ApCreditNoteRefundInput


## Properties

Name | Type
------------ | -------------
`date` | Date
`amount` | string
`bankAccountId` | string
`reference` | string

## Example

```typescript
import type { ApCreditNoteRefundInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "date": null,
  "amount": 1500000.00,
  "bankAccountId": null,
  "reference": null,
} satisfies ApCreditNoteRefundInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApCreditNoteRefundInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


