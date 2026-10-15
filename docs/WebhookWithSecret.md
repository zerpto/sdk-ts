
# WebhookWithSecret


## Properties

Name | Type
------------ | -------------
`id` | string
`url` | string
`description` | string
`eventTypes` | Array&lt;string&gt;
`status` | string
`createdAt` | Date
`secret` | string

## Example

```typescript
import type { WebhookWithSecret } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "url": null,
  "description": null,
  "eventTypes": null,
  "status": null,
  "createdAt": null,
  "secret": null,
} satisfies WebhookWithSecret

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as WebhookWithSecret
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


