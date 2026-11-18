
# RfqLine


## Properties

Name | Type
------------ | -------------
`id` | string
`itemId` | string
`description` | string
`specification` | string
`unit` | string
`totalQuantity` | string
`deliveries` | [Array&lt;RfqDelivery&gt;](RfqDelivery.md)

## Example

```typescript
import type { RfqLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "itemId": null,
  "description": null,
  "specification": null,
  "unit": null,
  "totalQuantity": 1500000.00,
  "deliveries": null,
} satisfies RfqLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


