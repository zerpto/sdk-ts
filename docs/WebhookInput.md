
# WebhookInput


## Properties

Name | Type
------------ | -------------
`url` | string
`description` | string
`eventTypes` | Array&lt;string&gt;

## Example

```typescript
import type { WebhookInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "url": null,
  "description": null,
  "eventTypes": null,
} satisfies WebhookInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WebhookInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


