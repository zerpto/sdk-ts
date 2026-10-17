
# PaymentMethod

A payment method the customer chose to save on the payment page. It carries no secret, only what is needed to show and manage it.

## Properties

Name | Type
------------ | -------------
`id` | string
`type` | string
`channel` | string
`label` | string
`status` | string
`expiresAt` | Date
`lastUsedAt` | Date
`createdAt` | Date

## Example

```typescript
import type { PaymentMethod } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": pmt-0192f3a1-5d2c-7e44-8b1f-3c9a6e0d7b25,
  "type": null,
  "channel": OVO,
  "label": OVO ••••1234,
  "status": null,
  "expiresAt": null,
  "lastUsedAt": null,
  "createdAt": null,
} satisfies PaymentMethod

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PaymentMethod
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


