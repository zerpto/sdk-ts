
# Delivery


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`salesOrderId` | string
`warehouseId` | string
`deliveryDate` | Date
`status` | string
`lines` | [Array&lt;DeliveryLinesInner&gt;](DeliveryLinesInner.md)
`journalEntryId` | string
`createdAt` | Date

## Example

```typescript
import type { Delivery } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "salesOrderId": null,
  "warehouseId": null,
  "deliveryDate": null,
  "status": null,
  "lines": null,
  "journalEntryId": null,
  "createdAt": null,
} satisfies Delivery

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Delivery
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


