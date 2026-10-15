
# GoodsReceiptInputLinesInner


## Properties

Name | Type
------------ | -------------
`poLineId` | string
`quantity` | string

## Example

```typescript
import type { GoodsReceiptInputLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "poLineId": null,
  "quantity": 1500000.00,
} satisfies GoodsReceiptInputLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as GoodsReceiptInputLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


