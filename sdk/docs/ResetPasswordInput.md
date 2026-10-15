
# ResetPasswordInput


## Properties

Name | Type
------------ | -------------
`token` | string
`newPassword` | string

## Example

```typescript
import type { ResetPasswordInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "token": null,
  "newPassword": null,
} satisfies ResetPasswordInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ResetPasswordInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


