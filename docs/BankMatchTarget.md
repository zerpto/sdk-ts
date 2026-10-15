
# BankMatchTarget


## Properties

Name | Type
------------ | -------------
`type` | string
`id` | string
`accountId` | string
`amount` | string

## Example

```typescript
import type { BankMatchTarget } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "type": null,
  "id": null,
  "accountId": null,
  "amount": 1500000.00,
} satisfies BankMatchTarget

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankMatchTarget
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


