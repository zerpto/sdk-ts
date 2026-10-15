
# PlanPrice

`extra_seat_price` is per additional user per billing cycle, beyond `included_seats`.

## Properties

Name | Type
------------ | -------------
`billingCycle` | string
`basePrice` | [Money](Money.md)
`extraSeatPrice` | [Money](Money.md)

## Example

```typescript
import type { PlanPrice } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "billingCycle": null,
  "basePrice": null,
  "extraSeatPrice": null,
} satisfies PlanPrice

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PlanPrice
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


