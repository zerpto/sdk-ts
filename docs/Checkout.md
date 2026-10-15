
# Checkout


## Properties

Name | Type
------------ | -------------
`paymentId` | string
`invoiceId` | string
`paymentUrl` | string
`expiresAt` | Date

## Example

```typescript
import type { Checkout } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "paymentId": null,
  "invoiceId": null,
  "paymentUrl": null,
  "expiresAt": null,
} satisfies Checkout

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Checkout
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


