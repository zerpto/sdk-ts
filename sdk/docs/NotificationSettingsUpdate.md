
# NotificationSettingsUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`invoiceSent` | boolean
`paymentReceived` | boolean
`invoiceOverdue` | boolean
`periodClosed` | boolean
`recipients` | Array&lt;string&gt;

## Example

```typescript
import type { NotificationSettingsUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "invoiceSent": null,
  "paymentReceived": null,
  "invoiceOverdue": null,
  "periodClosed": null,
  "recipients": null,
} satisfies NotificationSettingsUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as NotificationSettingsUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


