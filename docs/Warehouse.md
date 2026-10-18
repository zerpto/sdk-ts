
# Warehouse


## Properties

Name | Type
------------ | -------------
`id` | string
`code` | string
`name` | string
`address` | [Address](Address.md)
`status` | string
`createdAt` | Date

## Example

```typescript
import type { Warehouse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": whs-0192f3a1-5d2c-7e44-8b1f-3c9a6e0d7b25,
  "code": null,
  "name": null,
  "address": null,
  "status": null,
  "createdAt": null,
} satisfies Warehouse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Warehouse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


