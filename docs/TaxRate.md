
# TaxRate


## Properties

Name | Type
------------ | -------------
`id` | string
`code` | string
`name` | string
`rate` | string
`type` | string
`accountId` | string
`status` | string
`createdAt` | Date
`updatedAt` | Date

## Example

```typescript
import type { TaxRate } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "code": PPN11,
  "name": PPN 11%,
  "rate": 1500000.00,
  "type": null,
  "accountId": null,
  "status": null,
  "createdAt": null,
  "updatedAt": null,
} satisfies TaxRate

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as TaxRate
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


