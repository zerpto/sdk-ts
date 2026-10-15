
# BusinessPartner

A customer or a vendor. Both have the same fields.

## Properties

Name | Type
------------ | -------------
`id` | string
`code` | string
`name` | string
`email` | string
`phone` | string
`taxId` | string
`address` | [Address](Address.md)
`paymentTermsDays` | number
`status` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { BusinessPartner } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": cus-0191a8c2-7b3e-7c1d-9a52-4f6e8d2b1c07,
  "code": null,
  "name": null,
  "email": null,
  "phone": null,
  "taxId": null,
  "address": null,
  "paymentTermsDays": null,
  "status": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies BusinessPartner

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as BusinessPartner
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


