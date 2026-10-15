
# WarehouseUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`name` | string
`address` | [Address](Address.md)

## Example

```typescript
import type { WarehouseUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "address": null,
} satisfies WarehouseUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WarehouseUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


