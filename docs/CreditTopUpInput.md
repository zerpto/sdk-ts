
# CreditTopUpInput


## Properties

Name | Type
------------ | -------------
`amount` | [Money](Money.md)
`successUrl` | string
`cancelUrl` | string

## Example

```typescript
import type { CreditTopUpInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "amount": null,
  "successUrl": null,
  "cancelUrl": null,
} satisfies CreditTopUpInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreditTopUpInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


