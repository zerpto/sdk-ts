
# JournalEntryInput

Total debits must equal total credits.

## Properties

Name | Type
------------ | -------------
`date` | Date
`description` | string
`currency` | string
`lines` | [Array&lt;JournalLine&gt;](JournalLine.md)

## Example

```typescript
import type { JournalEntryInput } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "date": null,
  "description": null,
  "currency": IDR,
  "lines": null,
} satisfies JournalEntryInput

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as JournalEntryInput
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


