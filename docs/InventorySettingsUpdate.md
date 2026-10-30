
# InventorySettingsUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`inventoryAccountId` | string
`cogsAccountId` | string
`adjustmentAccountId` | string

## Example

```typescript
import type { InventorySettingsUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "inventoryAccountId": null,
  "cogsAccountId": null,
  "adjustmentAccountId": null,
} satisfies InventorySettingsUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as InventorySettingsUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


