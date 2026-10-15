
# Money

Standalone monetary amount. Inside documents that carry their own `currency`, amounts are plain Decimal strings.

## Properties

Name | Type
------------ | -------------
`amount` | string
`currency` | string

## Example

```typescript
import type { Money } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "amount": 1500000.00,
  "currency": IDR,
} satisfies Money

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Money
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


