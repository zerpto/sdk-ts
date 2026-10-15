
# TenantInput


## Properties

Name | Type
------------ | -------------
`name` | string
`legalName` | string
`taxId` | string
`address` | [Address](Address.md)
`baseCurrency` | string
`timezone` | string
`fiscalYearStartMonth` | number

## Example

```typescript
import type { TenantInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "legalName": null,
  "taxId": null,
  "address": null,
  "baseCurrency": IDR,
  "timezone": Asia/Jakarta,
  "fiscalYearStartMonth": null,
} satisfies TenantInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TenantInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


