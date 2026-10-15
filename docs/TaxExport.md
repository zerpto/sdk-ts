
# TaxExport


## Properties

Name | Type
------------ | -------------
`id` | string
`startDate` | Date
`endDate` | Date
`format` | string
`status` | string
`invoiceCount` | number
`downloadUrl` | string
`expiresAt` | Date
`error` | string
`createdAt` | Date

## Example

```typescript
import type { TaxExport } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "startDate": null,
  "endDate": null,
  "format": null,
  "status": null,
  "invoiceCount": null,
  "downloadUrl": null,
  "expiresAt": null,
  "error": null,
  "createdAt": null,
} satisfies TaxExport

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxExport
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


