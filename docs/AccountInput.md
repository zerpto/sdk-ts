
# AccountInput


## Properties

Name | Type
------------ | -------------
`code` | string
`name` | string
`type` | string
`parentId` | string
`isPostable` | boolean

## Example

```typescript
import type { AccountInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "code": 1-1100,
  "name": Kas,
  "type": null,
  "parentId": null,
  "isPostable": null,
} satisfies AccountInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AccountInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


