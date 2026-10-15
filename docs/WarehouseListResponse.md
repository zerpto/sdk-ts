
# WarehouseListResponse


## Properties

Name | Type
------------ | -------------
`data` | [Array&lt;Warehouse&gt;](Warehouse.md)
`meta` | [PageListMeta](PageListMeta.md)

## Example

```typescript
import type { WarehouseListResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies WarehouseListResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WarehouseListResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


