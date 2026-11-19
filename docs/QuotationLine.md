
# QuotationLine

One line of a quotation: the price you give, the volume tiers, tax and the deliveries you offer. Price is per line because volume discounts depend on the total quantity.

## Properties

Name | Type
------------ | -------------
`id` | string
`itemId` | string
`description` | string
`specification` | string
`unit` | string
`rfqItemNo` | number
`alternativeForItemNo` | number
`accountId` | string
`unitPrice` | string
`taxRateId` | string
`taxIncluded` | boolean
`moq` | string
`leadTimeDays` | number
`effectiveLeadTimeDays` | number
`priceBreaks` | [Array&lt;RfqPriceBreak&gt;](RfqPriceBreak.md)
`deliveries` | [Array&lt;QuotationDelivery&gt;](QuotationDelivery.md)
`totalOfferedQuantity` | string
`appliedPriceBreakMinQuantity` | string
`effectiveUnitPrice` | string
`effectiveUnitPriceExTax` | string
`effectiveUnitPriceIncTax` | string
`unitPriceExTax` | string
`unitPriceIncTax` | string
`appliedTaxRate` | string
`lineNetTotal` | string
`lineTaxTotal` | string
`lineGrossTotal` | string
`belowMoq` | boolean
`warnings` | [Array&lt;RfqQuoteLineWarning&gt;](RfqQuoteLineWarning.md)

## Example

```typescript
import type { QuotationLine } from '@zerpto/sdk'

// TODO: Update the object below with actual values
const example = {
  "id": null,
  "itemId": null,
  "description": null,
  "specification": null,
  "unit": null,
  "rfqItemNo": null,
  "alternativeForItemNo": null,
  "accountId": null,
  "unitPrice": null,
  "taxRateId": null,
  "taxIncluded": null,
  "moq": null,
  "leadTimeDays": null,
  "effectiveLeadTimeDays": null,
  "priceBreaks": null,
  "deliveries": null,
  "totalOfferedQuantity": 1500000.00,
  "appliedPriceBreakMinQuantity": null,
  "effectiveUnitPrice": null,
  "effectiveUnitPriceExTax": null,
  "effectiveUnitPriceIncTax": null,
  "unitPriceExTax": null,
  "unitPriceIncTax": null,
  "appliedTaxRate": null,
  "lineNetTotal": null,
  "lineTaxTotal": null,
  "lineGrossTotal": null,
  "belowMoq": null,
  "warnings": null,
} satisfies QuotationLine

console.log(example)

// Convert the instance to a JSON string
const exampleJSON: string = JSON.stringify(example)
console.log(exampleJSON)

// Parse the JSON string back to an object
const exampleParsed = JSON.parse(exampleJSON) as QuotationLine
console.log(exampleParsed)
```

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


