
# RfqDeliveryInput


## Properties

Name | Type
------------ | -------------
`quantity` | string
`warehouseId` | string
`requiredDate` | Date

## Example

```typescript
import type { RfqDeliveryInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "quantity": 1500000.00,
  "warehouseId": null,
  "requiredDate": null,
} satisfies RfqDeliveryInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqDeliveryInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


