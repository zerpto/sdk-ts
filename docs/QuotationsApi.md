# QuotationsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createQuotation**](QuotationsApi.md#createquotation) | **POST** /v1/sales/quotations | Create quotation |
| [**getQuotation**](QuotationsApi.md#getquotation) | **GET** /v1/sales/quotations/{id} | Get quotation |
| [**listQuotations**](QuotationsApi.md#listquotations) | **GET** /v1/sales/quotations | List quotations |
| [**updateQuotation**](QuotationsApi.md#updatequotation) | **PATCH** /v1/sales/quotations/{id} | Update quotation |



## createQuotation

> QuotationResponse createQuotation(quotationInput, idempotencyKey)

Create quotation

Creates a quotation in &#x60;draft&#x60; for one customer. It can answer a request for quotation you received as a document: send the &#x60;customer_id&#x60;, the &#x60;quote_date&#x60;, the &#x60;currency&#x60; and at least one line, and copy the buyer\&#39;s &#x60;rfq_number&#x60;, &#x60;rfq_date&#x60; and &#x60;rfq_reply_by&#x60; so the quotation can be matched to the request. Each line has a description, a &#x60;unit_price&#x60; with &#x60;tax_included&#x60;, and its &#x60;deliveries&#x60;: for every delivery the buyer asked for, the &#x60;ship_to_name&#x60; and &#x60;ship_to_address&#x60;, the &#x60;requested_quantity&#x60; and &#x60;requested_date&#x60;, and what you offer in &#x60;quantity_offered&#x60; and &#x60;promised_date&#x60;. A delivery you cannot supply is sent with &#x60;not_quoted&#x60; true. A line can also carry &#x60;moq&#x60;, &#x60;lead_time_days&#x60;, up to 10 volume &#x60;price_breaks&#x60; and, when a requested item is unavailable, be an alternative for it with &#x60;alternative_for_item_no&#x60;. On the quotation you can state &#x60;valid_until&#x60;, &#x60;payment_terms_days&#x60;, &#x60;delivery_terms&#x60; (&#x60;delivered&#x60; or &#x60;pickup&#x60;), freight, &#x60;sample_available&#x60; and &#x60;notes&#x60;. A line made without a request can send a &#x60;quantity&#x60; instead of &#x60;deliveries&#x60;. The server numbers the quotation and works out the line prices, taxes, &#x60;subtotal&#x60;, &#x60;tax_total&#x60;, &#x60;total&#x60; and &#x60;total_landed&#x60;. Nothing is committed to the customer and no stock is reserved. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;customer_id&#x60; from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers), and the &#x60;item_id&#x60;, &#x60;tax_rate_id&#x60; and &#x60;account_id&#x60; of each line from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), the tax rates and the chart of accounts. Edit the draft, and mark it &#x60;sent&#x60; or &#x60;accepted&#x60;, with [&#x60;PATCH /v1/sales/quotations/{id}&#x60;](#tag/quotations/PATCH/v1/sales/quotations/{id}). When the customer agrees, turn it into an order with [&#x60;POST /v1/sales/quotations/{id}/convert&#x60;](#tag/sales-orders/POST/v1/sales/quotations/{id}/convert).  Error codes: &#x60;unknown_customer&#x60;, &#x60;customer_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;, &#x60;invalid_payment_terms&#x60; (field &#x60;payment_terms_days&#x60;), &#x60;invalid_delivery&#x60; (field &#x60;lines&#x60;), &#x60;invalid_price_breaks&#x60; (field &#x60;lines&#x60;), &#x60;invalid_alternative&#x60; (field &#x60;lines&#x60;), &#x60;tax_rate_required&#x60; (field &#x60;lines&#x60;), &#x60;freight_included_conflict&#x60;, &#x60;freight_pickup_conflict&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  QuotationsApi,
} from '@zerpto/sdk';
import type { CreateQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new QuotationsApi(config);

  const body = {
    // QuotationInput
    quotationInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateQuotationRequest;

  try {
    const data = await api.createQuotation(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **quotationInput** | [QuotationInput](QuotationInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**QuotationResponse**](QuotationResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getQuotation

> QuotationResponse getQuotation(id)

Get quotation

Returns one quotation by its &#x60;id&#x60;, with its customer, status, dates, currency, notes, the request it answers (&#x60;rfq_number&#x60;, &#x60;rfq_date&#x60;, &#x60;rfq_reply_by&#x60;), your payment, delivery and freight terms, every line with its price breaks and deliveries, and the totals. Once the quotation is converted, &#x60;sales_order_id&#x60; points to the order made from it. Use it to show the quotation, to prefill an edit form, or to check its status before you convert it.  Take the &#x60;id&#x60; from [&#x60;GET /v1/sales/quotations&#x60;](#tag/quotations/GET/v1/sales/quotations) or from the response of [&#x60;POST /v1/sales/quotations&#x60;](#tag/quotations/POST/v1/sales/quotations). Change it with [&#x60;PATCH /v1/sales/quotations/{id}&#x60;](#tag/quotations/PATCH/v1/sales/quotations/{id}) until it is converted, and turn it into an order with [&#x60;POST /v1/sales/quotations/{id}/convert&#x60;](#tag/sales-orders/POST/v1/sales/quotations/{id}/convert). The order that results is read with [&#x60;GET /v1/sales/orders/{id}&#x60;](#tag/sales-orders/GET/v1/sales/orders/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  QuotationsApi,
} from '@zerpto/sdk';
import type { GetQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new QuotationsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetQuotationRequest;

  try {
    const data = await api.getQuotation(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |

### Return type

[**QuotationResponse**](QuotationResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## listQuotations

> QuotationListResponse listQuotations(perPage, page, sort, createdAfter, createdBefore, status, customerId)

List quotations

Lists the quotations you have made for customers, with status, dates, currency and totals. Use it to follow offers that are still open, to find quotations about to expire, or to review what a customer was offered. Filter by &#x60;status&#x60; or &#x60;customer_id&#x60; and narrow by creation date. Each quotation carries its lines.  Get a &#x60;customer_id&#x60; for the filter from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). New quotations are made with [&#x60;POST /v1/sales/quotations&#x60;](#tag/quotations/POST/v1/sales/quotations) and one quotation is read with [&#x60;GET /v1/sales/quotations/{id}&#x60;](#tag/quotations/GET/v1/sales/quotations/{id}). An accepted quotation becomes a sales order with [&#x60;POST /v1/sales/quotations/{id}/convert&#x60;](#tag/sales-orders/POST/v1/sales/quotations/{id}/convert).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  QuotationsApi,
} from '@zerpto/sdk';
import type { ListQuotationsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new QuotationsApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Field to sort by. Prefix with `-` for descending. (optional)
    sort: -created_at,
    // Date | Only records created after this time. (optional)
    createdAfter: 2013-10-20T19:20:30+01:00,
    // Date | Only records created before this time. (optional)
    createdBefore: 2013-10-20T19:20:30+01:00,
    // 'draft' | 'sent' | 'accepted' | 'expired' | 'converted' | Filter by status. (optional)
    status: status_example,
    // string | Filter by customer. (optional)
    customerId: customerId_example,
  } satisfies ListQuotationsRequest;

  try {
    const data = await api.listQuotations(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **perPage** | `number` | Page size. | [Optional] [Defaults to `25`] |
| **page** | `number` | Page number, starting at 1. | [Optional] [Defaults to `1`] |
| **sort** | `string` | Field to sort by. Prefix with &#x60;-&#x60; for descending. | [Optional] [Defaults to `undefined`] |
| **createdAfter** | `Date` | Only records created after this time. | [Optional] [Defaults to `undefined`] |
| **createdBefore** | `Date` | Only records created before this time. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `sent`, `accepted`, `expired`, `converted` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, sent, accepted, expired, converted] |
| **customerId** | `string` | Filter by customer. | [Optional] [Defaults to `undefined`] |

### Return type

[**QuotationListResponse**](QuotationListResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateQuotation

> QuotationResponse updateQuotation(id, quotationUpdate)

Update quotation

Changes a quotation that has not been converted. Send only the fields you want to change, and send &#x60;null&#x60; to clear an optional field such as &#x60;valid_until&#x60;, &#x60;delivery_terms&#x60; or &#x60;freight_cost&#x60;. When you send &#x60;lines&#x60;, the whole list replaces the old one, so a line comes with all its &#x60;deliveries&#x60; and &#x60;price_breaks&#x60; and you include every line you want to keep. Prices, taxes and totals are worked out again, and the tax rate of each line is frozen at this save. You can also move the &#x60;status&#x60; between &#x60;draft&#x60;, &#x60;sent&#x60; and &#x60;accepted&#x60; here. A converted quotation can no longer be edited, and the call returns 409.  Read the current quotation with [&#x60;GET /v1/sales/quotations/{id}&#x60;](#tag/quotations/GET/v1/sales/quotations/{id}) first, and take new &#x60;item_id&#x60; or &#x60;customer_id&#x60; values from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) or [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). When the customer accepts, create the order with [&#x60;POST /v1/sales/quotations/{id}/convert&#x60;](#tag/sales-orders/POST/v1/sales/quotations/{id}/convert).  Error codes: &#x60;quotation_not_editable&#x60;, &#x60;unknown_customer&#x60;, &#x60;customer_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;, &#x60;invalid_payment_terms&#x60; (field &#x60;payment_terms_days&#x60;), &#x60;invalid_delivery&#x60; (field &#x60;lines&#x60;), &#x60;invalid_price_breaks&#x60; (field &#x60;lines&#x60;), &#x60;invalid_alternative&#x60; (field &#x60;lines&#x60;), &#x60;tax_rate_required&#x60; (field &#x60;lines&#x60;), &#x60;freight_included_conflict&#x60;, &#x60;freight_pickup_conflict&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  QuotationsApi,
} from '@zerpto/sdk';
import type { UpdateQuotationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new QuotationsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // QuotationUpdate
    quotationUpdate: ...,
  } satisfies UpdateQuotationRequest;

  try {
    const data = await api.updateQuotation(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `string` | Resource ID. | [Defaults to `undefined`] |
| **quotationUpdate** | [QuotationUpdate](QuotationUpdate.md) |  | |

### Return type

[**QuotationResponse**](QuotationResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

