
# ThreeWayMatchLinesInner


## Properties

Name | Type
------------ | -------------
`lineId` | string
`receiptLineId` | string
`poLineId` | string
`itemId` | string
`status` | string
`poQuantity` | string
`receivedQuantity` | string
`billedQuantity` | string
`poUnitPrice` | string
`billedUnitPrice` | string
`quantityVariance` | string
`priceVariance` | string

## Example

```typescript
import type { ThreeWayMatchLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "lineId": null,
  "receiptLineId": null,
  "poLineId": null,
  "itemId": null,
  "status": null,
  "poQuantity": 1500000.00,
  "receivedQuantity": 1500000.00,
  "billedQuantity": 1500000.00,
  "poUnitPrice": 1500000.00,
  "billedUnitPrice": 1500000.00,
  "quantityVariance": 1500000.00,
  "priceVariance": 1500000.00,
} satisfies ThreeWayMatchLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ThreeWayMatchLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


