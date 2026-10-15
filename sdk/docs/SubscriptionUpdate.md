
# SubscriptionUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`plan` | string
`billingCycle` | string
`seats` | number
`apiAddon` | boolean

## Example

```typescript
import type { SubscriptionUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "plan": null,
  "billingCycle": null,
  "seats": null,
  "apiAddon": null,
} satisfies SubscriptionUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as SubscriptionUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


