
# ApprovalRuleInput


## Properties

Name | Type
------------ | -------------
`documentType` | string
`thresholdAmount` | string
`approverRoleId` | string
`isActive` | boolean

## Example

```typescript
import type { ApprovalRuleInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "documentType": null,
  "thresholdAmount": 1500000.00,
  "approverRoleId": null,
  "isActive": null,
} satisfies ApprovalRuleInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApprovalRuleInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


