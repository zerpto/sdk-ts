
# CustomerResponse

One record in `data`.

## Properties

Name | Type
------------ | -------------
`data` | [BusinessPartner](BusinessPartner.md)
`meta` | object

## Example

```typescript
import type { CustomerResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies CustomerResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CustomerResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


