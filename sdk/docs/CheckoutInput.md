
# CheckoutInput


## Properties

Name | Type
------------ | -------------
`invoiceId` | string
`paymentMethod` | string
`successUrl` | string
`failureUrl` | string

## Example

```typescript
import type { CheckoutInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "invoiceId": null,
  "paymentMethod": null,
  "successUrl": null,
  "failureUrl": null,
} satisfies CheckoutInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CheckoutInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


