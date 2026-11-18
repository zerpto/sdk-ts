
# RfqLineInput


## Properties

Name | Type
------------ | -------------
`itemId` | string
`description` | string
`specification` | string
`unit` | string
`quantity` | string
`deliveries` | [Array&lt;RfqDeliveryInput&gt;](RfqDeliveryInput.md)

## Example

```typescript
import type { RfqLineInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "itemId": null,
  "description": null,
  "specification": null,
  "unit": null,
  "quantity": null,
  "deliveries": null,
} satisfies RfqLineInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqLineInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


