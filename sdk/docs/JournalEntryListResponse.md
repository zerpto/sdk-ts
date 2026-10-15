
# JournalEntryListResponse


## Properties

Name | Type
------------ | -------------
`data` | [Array&lt;JournalEntry&gt;](JournalEntry.md)
`meta` | [CursorListMeta](CursorListMeta.md)

## Example

```typescript
import type { JournalEntryListResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies JournalEntryListResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as JournalEntryListResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


