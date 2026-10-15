
# RegistrationLoginAction

The login call. Use it after the email address is confirmed.

## Properties

Name | Type
------------ | -------------
`name` | string
`href` | string
`method` | string

## Example

```typescript
import type { RegistrationLoginAction } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": null,
  "href": null,
  "method": null,
} satisfies RegistrationLoginAction

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as RegistrationLoginAction
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


