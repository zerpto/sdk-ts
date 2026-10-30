
# CreditCardPaymentListResponse


## Properties

Name | Type
------------ | -------------
`data` | [Array&lt;CreditCardPayment&gt;](CreditCardPayment.md)
`meta` | [PageListMeta](PageListMeta.md)

## Example

```typescript
import type { CreditCardPaymentListResponse } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "data": null,
  "meta": null,
} satisfies CreditCardPaymentListResponse

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as CreditCardPaymentListResponse
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


