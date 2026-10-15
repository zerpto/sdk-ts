
# AssetDisposeInput


## Properties

Name | Type
------------ | -------------
`disposalDate` | Date
`type` | string
`proceeds` | string
`proceedsAccountId` | string
`notes` | string

## Example

```typescript
import type { AssetDisposeInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "disposalDate": null,
  "type": null,
  "proceeds": 1500000.00,
  "proceedsAccountId": null,
  "notes": null,
} satisfies AssetDisposeInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as AssetDisposeInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


