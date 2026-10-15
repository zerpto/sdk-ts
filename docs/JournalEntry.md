
# JournalEntry


## Properties

Name | Type
------------ | -------------
`id` | string
`number` | string
`date` | Date
`description` | string
`currency` | string
`lines` | [Array&lt;JournalLine&gt;](JournalLine.md)
`periodId` | string
`source` | string
`sourceId` | string
`status` | string
`createdAt` | Date

## Example

```typescript
import type { JournalEntry } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "number": null,
  "date": null,
  "description": null,
  "currency": IDR,
  "lines": null,
  "periodId": null,
  "source": null,
  "sourceId": null,
  "status": null,
  "createdAt": null,
} satisfies JournalEntry

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as JournalEntry
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


