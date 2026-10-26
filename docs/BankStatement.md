
# BankStatement


## Properties

Name | Type
------------ | -------------
`id` | string
`cashAccountId` | string
`filename` | string
`format` | string
`periodStart` | Date
`periodEnd` | Date
`openingBalance` | string
`closingBalance` | string
`lineCount` | number
`matchedCount` | number
`createdAt` | Date

## Example

```typescript
import type { BankStatement } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "cashAccountId": null,
  "filename": null,
  "format": null,
  "periodStart": null,
  "periodEnd": null,
  "openingBalance": 1500000.00,
  "closingBalance": 1500000.00,
  "lineCount": null,
  "matchedCount": null,
  "createdAt": null,
} satisfies BankStatement

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BankStatement
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


