
# RfqPriceBreak

One volume tier of a quote line, all-units.

## Properties

Name | Type
------------ | -------------
`minQuantity` | string
`unitPrice` | string
`unitPriceExTax` | string
`unitPriceIncTax` | string

## Example

```typescript
import type { RfqPriceBreak } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "minQuantity": 1500000.00,
  "unitPrice": 1500000.00,
  "unitPriceExTax": 1500000.00,
  "unitPriceIncTax": 1500000.00,
} satisfies RfqPriceBreak

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RfqPriceBreak
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


