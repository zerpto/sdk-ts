
# ApCreditNoteRefund


## Properties

Name | Type
------------ | -------------
`id` | string
`date` | Date
`amount` | string
`cashAccountId` | string
`reference` | string
`journalEntryId` | string
`createdAt` | Date

## Example

```typescript
import type { ApCreditNoteRefund } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "date": null,
  "amount": 1500000.00,
  "cashAccountId": null,
  "reference": null,
  "journalEntryId": null,
  "createdAt": null,
} satisfies ApCreditNoteRefund

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApCreditNoteRefund
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


