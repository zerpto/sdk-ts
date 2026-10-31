
# AccountUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`name` | string
`description` | string
`parentId` | string
`isPostable` | boolean

## Example

```typescript
import type { AccountUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "name": Kas,
  "description": null,
  "parentId": null,
  "isPostable": null,
} satisfies AccountUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AccountUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


