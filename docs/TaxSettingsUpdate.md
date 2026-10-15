
# TaxSettingsUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`npwp` | string
`pkpStatus` | boolean
`pkpSince` | Date
`defaultPpnRateId` | string
`defaultPph23RateId` | string

## Example

```typescript
import type { TaxSettingsUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "npwp": null,
  "pkpStatus": null,
  "pkpSince": null,
  "defaultPpnRateId": null,
  "defaultPph23RateId": null,
} satisfies TaxSettingsUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxSettingsUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


