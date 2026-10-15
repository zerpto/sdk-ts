
# SalesOrderListResponse


## Properties

Name | Type
------------ | -------------
`data` | [Array&lt;SalesOrder&gt;](SalesOrder.md)
`meta` | [PageListMeta](PageListMeta.md)

## Example

```typescript
import type { SalesOrderListResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies SalesOrderListResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SalesOrderListResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


