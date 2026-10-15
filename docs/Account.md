
# Account


## Properties

Name | Type
------------ | -------------
`id` | string
`code` | string
`name` | string
`type` | string
`parentId` | string
`isPostable` | boolean
`normalBalance` | string
`status` | string
`createdAt` | Date

## Example

```typescript
import type { Account } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "code": 1-1100,
  "name": Kas,
  "type": null,
  "parentId": null,
  "isPostable": null,
  "normalBalance": null,
  "status": null,
  "createdAt": null,
} satisfies Account

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Account
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


