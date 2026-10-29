
# Income


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`customerId` | string
`payerName` | string
`incomeDate` | Date
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
`attachments` | [Array&lt;FileAttachment&gt;](FileAttachment.md)
`journalEntryId` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Income } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "customerId": null,
  "payerName": null,
  "incomeDate": null,
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
} satisfies Income

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Income
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


