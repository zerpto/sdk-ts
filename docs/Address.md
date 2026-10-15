
# Address

A postal address, built on the region hierarchy (`GET /v1/regions`).  With a `region_id`, the address points to the deepest region the person picked. The server fills `country`, `province`, `district`, `sub_district`, `village` and `postal_code` from that region and the ones above it, and replaces any text sent for them, so a response always carries them.  A country that has region data requires a `region_id` that reaches the `required_depth` of that country, which is the sub-district for Indonesia, where the postal code is recorded.  A country without region data is typed by hand: leave `region_id` out, send `country`, and fill the other fields as text.  Error codes: `unknown_region`, `region_required`, `region_too_shallow`, `country_required`. 

## Properties

Name | Type
------------ | -------------
`regionId` | string
`line1` | string
`line2` | string
`country` | string
`province` | string
`district` | string
`subDistrict` | string
`village` | string
`postalCode` | string

## Example

```typescript
import type { Address } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "regionId": reg-0192f3a1-5d2c-7e44-8b1f-3c9a6e0d7b25,
  "line1": null,
  "line2": null,
  "country": ID,
  "province": null,
  "district": null,
  "subDistrict": null,
  "village": null,
  "postalCode": null,
} satisfies Address

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as Address
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


