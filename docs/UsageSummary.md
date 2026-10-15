
# UsageSummary


## Properties

Name | Type
------------ | -------------
`periodStart` | Date
`periodEnd` | Date
`meteringMode` | string
`planId` | string
`quota` | number
`used` | number
`remaining` | number
`overage` | number
`estimatedOverageCharge` | [Money](Money.md)
`groupBy` | string
`breakdown` | [Array&lt;UsageSummaryBreakdownInner&gt;](UsageSummaryBreakdownInner.md)

## Example

```typescript
import type { UsageSummary } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "periodStart": null,
  "periodEnd": null,
  "meteringMode": null,
  "planId": null,
  "quota": null,
  "used": null,
  "remaining": null,
  "overage": null,
  "estimatedOverageCharge": null,
  "groupBy": null,
  "breakdown": null,
} satisfies UsageSummary

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UsageSummary
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


