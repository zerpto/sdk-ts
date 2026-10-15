
# ThreeWayMatch


## Properties

Name | Type
------------ | -------------
`billId` | string
`status` | string
`tolerance` | [PurchasingSettings](PurchasingSettings.md)
`lines` | [Array&lt;ThreeWayMatchLinesInner&gt;](ThreeWayMatchLinesInner.md)

## Example

```typescript
import type { ThreeWayMatch } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "billId": null,
  "status": null,
  "tolerance": null,
  "lines": null,
} satisfies ThreeWayMatch

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as ThreeWayMatch
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


