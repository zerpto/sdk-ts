
# PagePagination


## Properties

Name | Type
------------ | -------------
`page` | number
`perPage` | number
`totalItems` | number
`totalPages` | number
`self` | string
`first` | string
`prev` | string
`next` | string
`last` | string

## Example

```typescript
import type { PagePagination } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "page": null,
  "perPage": null,
  "totalItems": null,
  "totalPages": null,
  "self": null,
  "first": null,
  "prev": null,
  "next": null,
  "last": null,
} satisfies PagePagination

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as PagePagination
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


