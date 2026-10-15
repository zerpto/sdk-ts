
# AuthAccount

The account as it moves through sign-up. `register` returns it as `pending_verification`; `verify-email` returns it as `active`.

## Properties

Name | Type
------------ | -------------
`id` | string
`email` | string
`name` | string
`status` | string

## Example

```typescript
import type { AuthAccount } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "email": null,
  "name": null,
  "status": null,
} satisfies AuthAccount

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AuthAccount
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


