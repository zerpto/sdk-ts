
# TaxExportInput


## Properties

Name | Type
------------ | -------------
`startDate` | Date
`endDate` | Date
`format` | string

## Example

```typescript
import type { TaxExportInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "startDate": null,
  "endDate": null,
  "format": null,
} satisfies TaxExportInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxExportInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


