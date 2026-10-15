
# ApprovalRule


## Properties

Name | Type
------------ | -------------
`id` | string
`documentType` | string
`thresholdAmount` | string
`currency` | string
`approverRoleId` | string
`isActive` | boolean
`createdAt` | Date

## Example

```typescript
import type { ApprovalRule } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "documentType": null,
  "thresholdAmount": 1500000.00,
  "currency": IDR,
  "approverRoleId": null,
  "isActive": null,
  "createdAt": null,
} satisfies ApprovalRule

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApprovalRule
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


