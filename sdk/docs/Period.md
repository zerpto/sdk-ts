
# Period


## Properties

Name | Type
------------ | -------------
`id` | string
`name` | string
`startDate` | Date
`endDate` | Date
`status` | string
`closedAt` | Date

## Example

```typescript
import type { Period } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "name": 2026-10,
  "startDate": null,
  "endDate": null,
  "status": null,
  "closedAt": null,
} satisfies Period

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Period
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


