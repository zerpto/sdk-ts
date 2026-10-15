
# BankMatch


## Properties

Name | Type
------------ | -------------
`type` | string
`id` | string
`amount` | string
`auto` | boolean

## Example

```typescript
import type { BankMatch } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "type": null,
  "id": null,
  "amount": 1500000.00,
  "auto": null,
} satisfies BankMatch

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankMatch
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


