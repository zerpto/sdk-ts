
# UsagePeriod


## Properties

Name | Type
------------ | -------------
`periodStart` | Date
`periodEnd` | Date
`planId` | string
`quota` | number
`used` | number
`overage` | number
`overageCharge` | [Money](Money.md)
`invoiceId` | string

## Example

```typescript
import type { UsagePeriod } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "periodStart": null,
  "periodEnd": null,
  "planId": null,
  "quota": null,
  "used": null,
  "overage": null,
  "overageCharge": null,
  "invoiceId": null,
} satisfies UsagePeriod

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UsagePeriod
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


