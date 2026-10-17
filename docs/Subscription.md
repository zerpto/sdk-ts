
# Subscription


## Properties

Name | Type
------------ | -------------
`plan` | string
`status` | string
`seats` | number
`apiAddon` | boolean
`currentPeriodEnd` | Date
`billingCycle` | string
`cancelAtPeriodEnd` | boolean
`trialEndsAt` | Date
`paymentMethodId` | string

## Example

```typescript
import type { Subscription } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "plan": null,
  "status": null,
  "seats": null,
  "apiAddon": null,
  "currentPeriodEnd": null,
  "billingCycle": null,
  "cancelAtPeriodEnd": null,
  "trialEndsAt": null,
  "paymentMethodId": pmt-0192f3a1-5d2c-7e44-8b1f-3c9a6e0d7b25,
} satisfies Subscription

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Subscription
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


