
# CustomerUpdate

All fields optional; only those sent are changed.

## Properties

Name | Type
------------ | -------------
`code` | string
`name` | string
`email` | string
`phone` | string
`taxId` | string
`address` | [Address](Address.md)
`paymentTermsDays` | number

## Example

```typescript
import type { CustomerUpdate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "code": null,
  "name": null,
  "email": null,
  "phone": null,
  "taxId": null,
  "address": null,
  "paymentTermsDays": null,
} satisfies CustomerUpdate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CustomerUpdate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


