
# Item


## Properties

Name | Type
------------ | -------------
`id` | string
`sku` | string
`name` | string
`description` | string
`type` | string
`unit` | string
`isStocked` | boolean
`defaultWarehouseId` | string
`salesPrice` | [Money](Money.md)
`purchasePrice` | [Money](Money.md)
`salesAccountId` | string
`purchaseAccountId` | string
`taxRateId` | string
`status` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { Item } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "sku": null,
  "name": null,
  "description": null,
  "type": null,
  "unit": pcs,
  "isStocked": null,
  "defaultWarehouseId": null,
  "salesPrice": null,
  "purchasePrice": null,
  "salesAccountId": null,
  "purchaseAccountId": null,
  "taxRateId": null,
  "status": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies Item

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Item
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


