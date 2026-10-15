
# TaxRateListResponse


## Properties

Name | Type
------------ | -------------
`data` | [Array&lt;TaxRate&gt;](TaxRate.md)
`meta` | [PageListMeta](PageListMeta.md)

## Example

```typescript
import type { TaxRateListResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies TaxRateListResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxRateListResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


