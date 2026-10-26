
# CashAccountInput


## Properties

Name | Type
------------ | -------------
`kind` | string
`name` | string
`bankName` | string
`accountNumber` | string
`currency` | string
`glAccountId` | string

## Example

```typescript
import type { CashAccountInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "kind": null,
  "name": null,
  "bankName": null,
  "accountNumber": null,
  "currency": IDR,
  "glAccountId": null,
} satisfies CashAccountInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CashAccountInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


