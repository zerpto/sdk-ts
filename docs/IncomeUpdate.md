
# IncomeUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`customerId` | string
`payerName` | string
`incomeDate` | Date
`currency` | string
`cashAccountId` | string
`method` | string
`reference` | string
`notes` | string
`lines` | [Array&lt;ReceiptLineInput&gt;](ReceiptLineInput.md)

## Example

```typescript
import type { IncomeUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "customerId": null,
  "payerName": null,
  "incomeDate": null,
  "currency": IDR,
  "cashAccountId": null,
  "method": null,
  "reference": null,
  "notes": null,
  "lines": null,
} satisfies IncomeUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as IncomeUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


