
# ReceiptAttachment

A file uploaded to a receipt-style document (Expense, Income), labelled by what it proves.

## Properties

Name | Type
------------ | -------------
`id` | string
`kind` | string
`filename` | string
`contentType` | string
`size` | number
`downloadUrl` | string
`createdAt` | Date

## Example

```typescript
import type { ReceiptAttachment } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "kind": null,
  "filename": null,
  "contentType": null,
  "size": null,
  "downloadUrl": null,
  "createdAt": null,
} satisfies ReceiptAttachment

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ReceiptAttachment
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


