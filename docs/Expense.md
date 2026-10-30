
# Expense


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`vendorId` | string
`payeeName` | string
`expenseDate` | Date
`currency` | string
`cashAccountId` | string
`method` | string
`reference` | string
`notes` | string
`status` | string
`lines` | [Array&lt;ReceiptLine&gt;](ReceiptLine.md)
`subtotal` | string
`taxTotal` | string
`total` | string
`attachments` | [Array&lt;ReceiptAttachment&gt;](ReceiptAttachment.md)
`journalEntryId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Expense } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "vendorId": null,
  "payeeName": null,
  "expenseDate": null,
  "currency": IDR,
  "cashAccountId": null,
  "method": null,
  "reference": null,
  "notes": null,
  "status": null,
  "lines": null,
  "subtotal": 1500000.00,
  "taxTotal": 1500000.00,
  "total": 1500000.00,
  "attachments": null,
  "journalEntryId": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Expense

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Expense
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


