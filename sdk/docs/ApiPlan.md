
# ApiPlan


## Properties

Name | Type
------------ | -------------
`id` | string
`name` | string
`monthlyQuota` | number
`price` | [Money](Money.md)
`overagePricePer1000` | [Money](Money.md)
`rateLimitPerMinute` | number
`isCurrent` | boolean

## Example

```typescript
import type { ApiPlan } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": api_growth,
  "name": null,
  "monthlyQuota": null,
  "price": null,
  "overagePricePer1000": null,
  "rateLimitPerMinute": null,
  "isCurrent": null,
} satisfies ApiPlan

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ApiPlan
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


