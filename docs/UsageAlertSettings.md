
# UsageAlertSettings


## Properties

Name | Type
------------ | -------------
`enabled` | boolean
`thresholdsPercent` | Array&lt;number&gt;
`recipients` | Array&lt;string&gt;

## Example

```typescript
import type { UsageAlertSettings } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "enabled": null,
  "thresholdsPercent": null,
  "recipients": null,
} satisfies UsageAlertSettings

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as UsageAlertSettings
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


