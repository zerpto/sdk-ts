
# TaxWithholdingResponse


## Properties

Name | Type
------------ | -------------
`data` | [TaxWithholding](TaxWithholding.md)
`meta` | object

## Example

```typescript
import type { TaxWithholdingResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies TaxWithholdingResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxWithholdingResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


