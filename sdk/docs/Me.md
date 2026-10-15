
# Me


## Properties

Name | Type
------------ | -------------
`user` | [AuthUser](AuthUser.md)
`tenant` | [TenantSummary](TenantSummary.md)
`permissions` | Array&lt;string&gt;

## Example

```typescript
import type { Me } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "user": null,
  "tenant": null,
  "permissions": null,
} satisfies Me

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Me
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


