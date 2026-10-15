
# Region

One place in the hierarchy. Every level uses this same object. A region can carry its parent in `parent` (see `include`), and `depth` says how far down it is (a country has depth 1).

## Properties

Name | Type
------------ | -------------
`id` | string
`parent` | [Region](Region.md)
`depth` | number
`levelLabel` | string
`code` | string
`name` | string
`postalCode` | string
`hasChildren` | boolean
`requiredDepth` | number

## Example

```typescript
import type { Region } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": reg-0192f3a1-5d2c-7e44-8b1f-3c9a6e0d7b25,
  "parent": null,
  "depth": 4,
  "levelLabel": Kecamatan,
  "code": 317304,
  "name": Menteng,
  "postalCode": 10310,
  "hasChildren": null,
  "requiredDepth": 4,
} satisfies Region

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Region
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


