
# UserPermissionGrant


## Properties

Name | Type
------------ | -------------
`permission` | string
`expiresAt` | Date
`grantedBy` | string
`grantedAt` | Date

## Example

```typescript
import type { UserPermissionGrant } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "permission": ap.payments.approve,
  "expiresAt": null,
  "grantedBy": null,
  "grantedAt": null,
} satisfies UserPermissionGrant

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UserPermissionGrant
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


