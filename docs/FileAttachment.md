
# FileAttachment

A file uploaded to one document, such as the delivery note of a goods receipt.

## Properties

Name | Type
------------ | -------------
`id` | string
`filename` | string
`contentType` | string
`size` | number
`downloadUrl` | string
`createdAt` | Date

## Example

```typescript
import type { FileAttachment } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "filename": null,
  "contentType": null,
  "size": null,
  "downloadUrl": null,
  "createdAt": null,
} satisfies FileAttachment

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as FileAttachment
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


