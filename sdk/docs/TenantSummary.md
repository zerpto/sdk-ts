
# TenantSummary


## Properties

Name | Type
------------ | -------------
`id` | string
`name` | string
`roles` | Array&lt;string&gt;

## Example

```typescript
import type { TenantSummary } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "name": null,
  "roles": null,
} satisfies TenantSummary

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TenantSummary
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


