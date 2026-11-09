
# SeatPrice

The price of one seat for one month in one currency, with PPN already included. Base price and PPN are shown for information.

## Properties

Name | Type
------------ | -------------
`currency` | string
`seatPrice` | string
`basePrice` | string
`taxAmount` | string
`taxRate` | string

## Example

```typescript
import type { SeatPrice } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "currency": IDR,
  "seatPrice": 1500000.00,
  "basePrice": 1500000.00,
  "taxAmount": 1500000.00,
  "taxRate": 1500000.00,
} satisfies SeatPrice

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SeatPrice
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


