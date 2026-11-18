# RFQApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**awardRfq**](RFQApi.md#awardrfq) | **POST** /v1/purchasing/rfqs/{id}/award | Award a quote |
| [**cancelRfq**](RFQApi.md#cancelrfq) | **POST** /v1/purchasing/rfqs/{id}/cancel | Cancel RFQ |
| [**convertRfq**](RFQApi.md#convertrfq) | **POST** /v1/purchasing/rfqs/{id}/convert | Convert RFQ to order |
| [**createRfq**](RFQApi.md#createrfq) | **POST** /v1/purchasing/rfqs | Create RFQ |
| [**createRfqQuote**](RFQApi.md#createrfqquote) | **POST** /v1/purchasing/rfqs/{id}/quotes | Record a vendor quote |
| [**getRfq**](RFQApi.md#getrfq) | **GET** /v1/purchasing/rfqs/{id} | Get RFQ |
| [**getRfqComparison**](RFQApi.md#getrfqcomparison) | **GET** /v1/purchasing/rfqs/{id}/comparison | Compare vendor quotes |
| [**listRfqs**](RFQApi.md#listrfqs) | **GET** /v1/purchasing/rfqs | List RFQs |
| [**sendRfq**](RFQApi.md#sendrfq) | **POST** /v1/purchasing/rfqs/{id}/send | Send RFQ to vendors |
| [**updateRfq**](RFQApi.md#updaterfq) | **PATCH** /v1/purchasing/rfqs/{id} | Update RFQ |
| [**updateRfqQuote**](RFQApi.md#updaterfqquote) | **PATCH** /v1/purchasing/rfqs/{id}/quotes/{quote_id} | Update a vendor quote |



## awardRfq

> RfqResponse awardRfq(id, rfqAwardInput, idempotencyKey)

Award a quote

Chooses the winning quote of a sent request. The chosen quote becomes &#x60;awarded&#x60;, the others become &#x60;rejected&#x60;, and the request becomes &#x60;awarded&#x60;. Use it once the quotes have been compared. Awarding again with another quote is allowed until the request is converted, and it swaps the winner. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  The &#x60;quote_id&#x60; comes from [&#x60;GET /v1/purchasing/rfqs/{{id}}/comparison&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}/comparison). Turn the winner into a purchase order with [&#x60;POST /v1/purchasing/rfqs/{{id}}/convert&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/convert). To stop instead, call [&#x60;POST /v1/purchasing/rfqs/{{id}}/cancel&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/cancel).  Error codes: &#x60;rfq_not_open&#x60;, &#x60;unknown_quote&#x60;, &#x60;quote_expired&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { AwardRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // RfqAwardInput
    rfqAwardInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies AwardRfqRequest;

  try {
    const data = await api.awardRfq(body);
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
| **rfqAwardInput** | [RfqAwardInput](RfqAwardInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**RfqResponse**](RfqResponse.md)

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


## cancelRfq

> RfqResponse cancelRfq(id, idempotencyKey)

Cancel RFQ

Cancels a request that you no longer need. The request becomes &#x60;cancelled&#x60; and its quotes are kept for the record. Use it for a draft you dropped, or for a sent or awarded request that will not lead to an order. A converted request cannot be cancelled: cancel the purchase order instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Vendors that were already sent the request are not told, so tell them yourself. To go on with a different winner instead of cancelling, award another quote with [&#x60;POST /v1/purchasing/rfqs/{{id}}/award&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/award). A purchase order made from the request is cancelled with [&#x60;POST /v1/purchasing/orders/{{id}}/cancel&#x60;](#tag/orders/POST/v1/purchasing/orders/{{id}}/cancel).  Error codes: &#x60;rfq_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { CancelRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelRfqRequest;

  try {
    const data = await api.cancelRfq(body);
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
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**RfqResponse**](RfqResponse.md)

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
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## convertRfq

> PurchaseOrderResponse convertRfq(id, idempotencyKey)

Convert RFQ to order

Converts the awarded quote into a purchase order. The vendor, the currency and the lines the vendor offered, with their prices and taxes, are copied into a new order in &#x60;draft&#x60;, and the request becomes &#x60;converted&#x60; with its &#x60;purchase_order_id&#x60; set. Use it once the winner has been agreed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Award a quote with [&#x60;POST /v1/purchasing/rfqs/{{id}}/award&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/award) before you convert. The response is the new order, which you can still adjust with [&#x60;PATCH /v1/purchasing/orders/{{id}}&#x60;](#tag/orders/PATCH/v1/purchasing/orders/{{id}}) and then send on with [&#x60;POST /v1/purchasing/orders/{{id}}/submit&#x60;](#tag/orders/POST/v1/purchasing/orders/{{id}}/submit). Find it later with [&#x60;GET /v1/purchasing/orders/{{id}}&#x60;](#tag/orders/GET/v1/purchasing/orders/{{id}}).  Error codes: &#x60;rfq_not_awarded&#x60;, &#x60;already_converted&#x60;, &#x60;quote_expired&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { ConvertRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies ConvertRfqRequest;

  try {
    const data = await api.convertRfq(body);
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
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**PurchaseOrderResponse**](PurchaseOrderResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createRfq

> RfqResponse createRfq(rfqInput, idempotencyKey)

Create RFQ

Creates a request for quotation in &#x60;draft&#x60;. Send the &#x60;rfq_date&#x60;, the &#x60;reply_by&#x60; date, the &#x60;currency&#x60;, the &#x60;vendor_ids&#x60; you want a price from and at least one line with a description and a quantity; &#x60;notes&#x60; and an &#x60;item_id&#x60; per line are optional. The server numbers the request. Nothing reaches a vendor until the request is sent. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;vendor_ids&#x60; from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors) and the &#x60;item_id&#x60; of each line from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items). Edit the draft with [&#x60;PATCH /v1/purchasing/rfqs/{{id}}&#x60;](#tag/rfq/PATCH/v1/purchasing/rfqs/{{id}}), then send it with [&#x60;POST /v1/purchasing/rfqs/{{id}}/send&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/send). A draft you no longer need is dropped with [&#x60;POST /v1/purchasing/rfqs/{{id}}/cancel&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/cancel).  Error codes: &#x60;unknown_vendor&#x60;, &#x60;vendor_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;vendors_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { CreateRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // RfqInput
    rfqInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateRfqRequest;

  try {
    const data = await api.createRfq(body);
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
| **rfqInput** | [RfqInput](RfqInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**RfqResponse**](RfqResponse.md)

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


## createRfqQuote

> RfqQuoteResponse createRfqQuote(id, rfqQuoteInput, idempotencyKey)

Record a vendor quote

Records the reply of one invited vendor to a sent request. Send the &#x60;vendor_id&#x60;, the &#x60;quote_date&#x60;, optionally &#x60;valid_until&#x60;, &#x60;lead_time_days&#x60; and &#x60;notes&#x60;, and a price for each line of the request, with the &#x60;unit_price&#x60; left null for a line the vendor does not offer. The server works out each line\&#39;s subtotal and tax and the quote\&#39;s totals. A vendor has one quote per request: to change it, edit it. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it after [&#x60;POST /v1/purchasing/rfqs/{{id}}/send&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/send), once a vendor has answered. Fix a mistake with [&#x60;PATCH /v1/purchasing/rfqs/{{id}}/quotes/{{quote_id}}&#x60;](#tag/rfq/PATCH/v1/purchasing/rfqs/{{id}}/quotes/{{quote_id}}), then compare the replies with [&#x60;GET /v1/purchasing/rfqs/{{id}}/comparison&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}/comparison). Take a &#x60;tax_rate_id&#x60; from [&#x60;GET /v1/tax-rates&#x60;](#tag/tax-and-currencies/GET/v1/tax-rates).  Error codes: &#x60;rfq_not_open&#x60;, &#x60;vendor_not_invited&#x60;, &#x60;quote_exists&#x60;, &#x60;unknown_rfq_line&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;all_lines_missing&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { CreateRfqQuoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // RfqQuoteInput
    rfqQuoteInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateRfqQuoteRequest;

  try {
    const data = await api.createRfqQuote(body);
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
| **rfqQuoteInput** | [RfqQuoteInput](RfqQuoteInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**RfqQuoteResponse**](RfqQuoteResponse.md)

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
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getRfq

> RfqResponse getRfq(id)

Get RFQ

Returns one request for quotation by its &#x60;id&#x60;, with its status, dates, currency, the vendors invited, every line and every quote recorded so far, each with its totals. Use it to show the request, to prefill an edit form, or to see who has replied before you decide.  Take the &#x60;id&#x60; from [&#x60;GET /v1/purchasing/rfqs&#x60;](#tag/rfq/GET/v1/purchasing/rfqs) or from the response of [&#x60;POST /v1/purchasing/rfqs&#x60;](#tag/rfq/POST/v1/purchasing/rfqs). While it is a &#x60;draft&#x60;, change it with [&#x60;PATCH /v1/purchasing/rfqs/{{id}}&#x60;](#tag/rfq/PATCH/v1/purchasing/rfqs/{{id}}). Record replies with [&#x60;POST /v1/purchasing/rfqs/{{id}}/quotes&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/quotes), line them up with [&#x60;GET /v1/purchasing/rfqs/{{id}}/comparison&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}/comparison), and pick one with [&#x60;POST /v1/purchasing/rfqs/{{id}}/award&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/award).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { GetRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetRfqRequest;

  try {
    const data = await api.getRfq(body);
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

[**RfqResponse**](RfqResponse.md)

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


## getRfqComparison

> RfqComparisonResponse getRfqComparison(id)

Compare vendor quotes

Lines up the quotes of a request side by side. For every line it shows what each vendor offered and which price is the lowest, and for every vendor it shows the total and the lead time. Use it to choose a winner. It only reads: nothing is decided until a quote is awarded.  The quotes come from [&#x60;POST /v1/purchasing/rfqs/{{id}}/quotes&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/quotes). When you have chosen, pick the winner with [&#x60;POST /v1/purchasing/rfqs/{{id}}/award&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/award). A vendor that did not offer a line has no entry for it, and a quote that does not cover every line is not comparable on its total, which &#x60;lines_offered&#x60; makes visible.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { GetRfqComparisonRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetRfqComparisonRequest;

  try {
    const data = await api.getRfqComparison(body);
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

[**RfqComparisonResponse**](RfqComparisonResponse.md)

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


## listRfqs

> RfqListResponse listRfqs(perPage, page, sort, createdAfter, createdBefore, status, vendorId)

List RFQs

Lists the requests for quotation you have written, with status, reply-by date, the vendors invited and how many quotes have come back. Use it to follow open requests, to find ones waiting for a decision, or to review what a vendor was asked to price. Filter by &#x60;status&#x60; or &#x60;vendor_id&#x60; and narrow by creation date.  Get a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). New requests are made with [&#x60;POST /v1/purchasing/rfqs&#x60;](#tag/rfq/POST/v1/purchasing/rfqs) and one request is read with [&#x60;GET /v1/purchasing/rfqs/{{id}}&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}). An awarded request becomes a purchase order with [&#x60;POST /v1/purchasing/rfqs/{{id}}/convert&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/convert).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { ListRfqsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

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
    // 'draft' | 'sent' | 'awarded' | 'converted' | 'cancelled' | Filter by status. (optional)
    status: status_example,
    // string | Only requests that invited this vendor. (optional)
    vendorId: vendorId_example,
  } satisfies ListRfqsRequest;

  try {
    const data = await api.listRfqs(body);
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
| **status** | `draft`, `sent`, `awarded`, `converted`, `cancelled` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, sent, awarded, converted, cancelled] |
| **vendorId** | `string` | Only requests that invited this vendor. | [Optional] [Defaults to `undefined`] |

### Return type

[**RfqListResponse**](RfqListResponse.md)

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


## sendRfq

> RfqResponse sendRfq(id, idempotencyKey)

Send RFQ to vendors

Sends a draft request to every vendor invited. Each vendor gets an email with the lines and quantities and the &#x60;reply_by&#x60; date, and the request becomes &#x60;sent&#x60;. From then on vendor replies can be recorded. Use it when the draft is ready to go out. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the request with [&#x60;POST /v1/purchasing/rfqs&#x60;](#tag/rfq/POST/v1/purchasing/rfqs) and [&#x60;PATCH /v1/purchasing/rfqs/{{id}}&#x60;](#tag/rfq/PATCH/v1/purchasing/rfqs/{{id}}) before you send it. Zerpto does not collect the answers: when a vendor replies by email, phone or message, type the prices in with [&#x60;POST /v1/purchasing/rfqs/{{id}}/quotes&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/quotes). If you send by mistake, [&#x60;POST /v1/purchasing/rfqs/{{id}}/cancel&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/cancel) stops the request.  Error codes: &#x60;rfq_not_sendable&#x60;, &#x60;vendor_email_missing&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { SendRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies SendRfqRequest;

  try {
    const data = await api.sendRfq(body);
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
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**RfqResponse**](RfqResponse.md)

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
| **403** | The key or user may not do this. The error &#x60;code&#x60; says why: &#x60;permission_denied&#x60; when the role or key lacks the permission, &#x60;plan_required&#x60; when the tenant\&#39;s plan does not include the feature (the &#x60;message&#x60; names the feature key), and &#x60;read_only_user&#x60; when the user is read-only and the call writes. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateRfq

> RfqResponse updateRfq(id, rfqUpdate)

Update RFQ

Changes a request for quotation that is still a &#x60;draft&#x60;. Send only the fields you want to change. When you send &#x60;lines&#x60; or &#x60;vendor_ids&#x60;, the whole list replaces the old one, so include everything you want to keep. A request that has been sent can no longer be edited, and the call returns 409.  Read the current request with [&#x60;GET /v1/purchasing/rfqs/{{id}}&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}) first, and take new vendors or items from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors) or [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items). When the draft is ready, send it with [&#x60;POST /v1/purchasing/rfqs/{{id}}/send&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/send). To stop a request that has left draft, use [&#x60;POST /v1/purchasing/rfqs/{{id}}/cancel&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/cancel).  Error codes: &#x60;rfq_not_editable&#x60;, &#x60;unknown_vendor&#x60;, &#x60;vendor_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;vendors_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { UpdateRfqRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // RfqUpdate
    rfqUpdate: ...,
  } satisfies UpdateRfqRequest;

  try {
    const data = await api.updateRfq(body);
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
| **rfqUpdate** | [RfqUpdate](RfqUpdate.md) |  | |

### Return type

[**RfqResponse**](RfqResponse.md)

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


## updateRfqQuote

> RfqQuoteResponse updateRfqQuote(id, quoteId, rfqQuoteUpdate)

Update a vendor quote

Changes a quote that has been recorded, for example when the vendor revises a price or extends the validity. Send only the fields you want to change; when you send &#x60;lines&#x60;, the whole list replaces the old one. Totals are worked out again. Use it while the request is &#x60;sent&#x60;. A request that has been awarded can no longer change its quotes, and the call returns 409.  The &#x60;quote_id&#x60; comes from &#x60;quotes&#x60; in [&#x60;GET /v1/purchasing/rfqs/{{id}}&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}) or from [&#x60;POST /v1/purchasing/rfqs/{{id}}/quotes&#x60;](#tag/rfq/POST/v1/purchasing/rfqs/{{id}}/quotes). After the change, compare again with [&#x60;GET /v1/purchasing/rfqs/{{id}}/comparison&#x60;](#tag/rfq/GET/v1/purchasing/rfqs/{{id}}/comparison).  Error codes: &#x60;rfq_not_open&#x60;, &#x60;unknown_rfq_line&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;all_lines_missing&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RFQApi,
} from '@zerpto/sdk';
import type { UpdateRfqQuoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RFQApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | The quote, from the request\'s `quotes`.
    quoteId: quoteId_example,
    // RfqQuoteUpdate
    rfqQuoteUpdate: ...,
  } satisfies UpdateRfqQuoteRequest;

  try {
    const data = await api.updateRfqQuote(body);
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
| **quoteId** | `string` | The quote, from the request\&#39;s &#x60;quotes&#x60;. | [Defaults to `undefined`] |
| **rfqQuoteUpdate** | [RfqQuoteUpdate](RfqQuoteUpdate.md) |  | |

### Return type

[**RfqQuoteResponse**](RfqQuoteResponse.md)

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

