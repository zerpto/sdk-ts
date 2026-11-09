
# Permission


## Properties

Name | Type
------------ | -------------
`key` | string
`module` | string
`kind` | string
`minimumPlan` | string
`locked` | boolean
`description` | string

## Example

```typescript
import type { Permission } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "key": ar.invoices.post,
  "module": ar,
  "kind": null,
  "minimumPlan": null,
  "locked": null,
  "description": null,
} satisfies Permission

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Permission
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


