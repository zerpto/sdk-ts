
# WarehouseInput


## Properties

Name | Type
------------ | -------------
`code` | string
`name` | string
`address` | [Address](Address.md)

## Example

```typescript
import type { WarehouseInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "code": null,
  "name": null,
  "address": null,
} satisfies WarehouseInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WarehouseInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


