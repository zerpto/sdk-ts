
# DeliveryLinesInner


## Properties

Name | Type
------------ | -------------
`id` | string
`soLineId` | string
`itemId` | string
`quantity` | string

## Example

```typescript
import type { DeliveryLinesInner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "soLineId": null,
  "itemId": null,
  "quantity": 1500000.00,
} satisfies DeliveryLinesInner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as DeliveryLinesInner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


