# PurchasingApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getApInvoiceMatch**](PurchasingApi.md#getapinvoicematch) | **GET** /v1/ap/invoices/{id}/match | Three-way match for a bill |
| [**getPurchasingSettings**](PurchasingApi.md#getpurchasingsettings) | **GET** /v1/purchasing/settings | Get purchasing settings |
| [**updatePurchasingSettings**](PurchasingApi.md#updatepurchasingsettings) | **PATCH** /v1/purchasing/settings | Update purchasing settings |



## getApInvoiceMatch

> ThreeWayMatchResponse getApInvoiceMatch(id)

Three-way match for a bill

Compares a bill with the purchase order and goods receipts it is linked to, line by line, and returns the result. Each line shows the ordered, received and already billed quantities, the order price against the billed price, and the quantity and price differences. The overall &#x60;status&#x60; is the worst line status: &#x60;matched&#x60;, &#x60;within_tolerance&#x60;, &#x60;exceeds_tolerance&#x60;, or &#x60;not_applicable&#x60; for a bill that is not made from receipts. Lines without a receipt, such as freight, are &#x60;not_applicable&#x60; and are not matched.  The tolerances come from [&#x60;GET /v1/purchasing/settings&#x60;](#tag/purchasing/GET/v1/purchasing/settings), and the result includes them in &#x60;tolerance&#x60;. Use this call while the bill is still a draft, after [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) or [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills), to show the differences, and fix them with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}). Posting the bill with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm) runs the same check and is refused when a line exceeds tolerance. The bill itself is read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchasingApi,
} from '@zerpto/sdk';
import type { GetApInvoiceMatchRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchasingApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetApInvoiceMatchRequest;

  try {
    const data = await api.getApInvoiceMatch(body);
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

[**ThreeWayMatchResponse**](ThreeWayMatchResponse.md)

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


## getPurchasingSettings

> PurchasingSettingsResponse getPurchasingSettings()

Get purchasing settings

Returns the purchasing settings of the tenant: the quantity and price tolerance in percent, and the GL accounts used for goods received not invoiced (GRNI), for differences within tolerance and for down payments to vendors. Use it to show a settings screen, or to tell the user how much difference a bill may have before it is refused. The tolerances default to 0, which means a bill must match exactly.  Change the values with [&#x60;PATCH /v1/purchasing/settings&#x60;](#tag/purchasing/PATCH/v1/purchasing/settings). The tolerances are what [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match) compares a bill against, and what the post call of a bill enforces with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm). The account ids come from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchasingApi,
} from '@zerpto/sdk';
import type { GetPurchasingSettingsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchasingApi(config);

  try {
    const data = await api.getPurchasingSettings();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**PurchasingSettingsResponse**](PurchasingSettingsResponse.md)

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


## updatePurchasingSettings

> PurchasingSettingsResponse updatePurchasingSettings(purchasingSettingsUpdate)

Update purchasing settings

Changes the purchasing settings. Send only the fields you want to change; the others stay as they are. Set an account to &#x60;null&#x60; to clear it. The tolerances are percentages written as decimal strings and cannot be negative. The new values apply to bills posted afterwards, and bills that are already posted are not recalculated.  Read the current values first with [&#x60;GET /v1/purchasing/settings&#x60;](#tag/purchasing/GET/v1/purchasing/settings), and take account ids from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts); only accounts that accept postings can be used. After a change, [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match) shows a draft bill against the new tolerances, and [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm) uses them.  Error codes: &#x60;invalid_tolerance&#x60;, &#x60;unknown_account&#x60;, &#x60;account_not_postable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchasingApi,
} from '@zerpto/sdk';
import type { UpdatePurchasingSettingsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchasingApi(config);

  const body = {
    // PurchasingSettingsUpdate
    purchasingSettingsUpdate: ...,
  } satisfies UpdatePurchasingSettingsRequest;

  try {
    const data = await api.updatePurchasingSettings(body);
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
| **purchasingSettingsUpdate** | [PurchasingSettingsUpdate](PurchasingSettingsUpdate.md) |  | |

### Return type

[**PurchasingSettingsResponse**](PurchasingSettingsResponse.md)

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
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

