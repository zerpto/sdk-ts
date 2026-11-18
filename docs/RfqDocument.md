
# RfqDocument

The request for quotation as a PDF for one vendor.

## Properties

Name | Type
------------ | -------------
`vendorId` | string
`filename` | string
`contentType` | string
`size` | number
`downloadUrl` | string
`expiresAt` | Date

## Example

```typescript
import type { RfqDocument } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "vendorId": null,
  "filename": null,
  "contentType": application/pdf,
  "size": null,
  "downloadUrl": null,
  "expiresAt": null,
} satisfies RfqDocument

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqDocument
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


