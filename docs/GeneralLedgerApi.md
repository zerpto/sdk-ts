# GeneralLedgerApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**closePeriod**](GeneralLedgerApi.md#closeperiod) | **POST** /v1/gl/periods/{id}/close | Close an accounting period |
| [**listPeriods**](GeneralLedgerApi.md#listperiods) | **GET** /v1/gl/periods | List accounting periods |



## closePeriod

> PeriodResponse closePeriod(id)

Close an accounting period

Closes an accounting period, so nothing more can be posted into it. Use it after month end, once the books for the period are final. Posting an invoice, a payment, a delivery or a journal entry dated in a closed period fails with 422, and a closed period cannot be opened again. The response is the period with its status &#x60;closed&#x60; and the time it was closed.  Find the period &#x60;id&#x60; with [&#x60;GET /v1/gl/periods&#x60;](#tag/general-ledger/GET/v1/gl/periods). Close periods in order: an earlier period that is still open must be closed first. If an entry is wrong after closing, post a correcting entry in an open period, using [&#x60;POST /v1/gl/journal-entries&#x60;](#tag/journal/POST/v1/gl/journal-entries).  Error codes: &#x60;period_already_closed&#x60;, &#x60;previous_period_open&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  GeneralLedgerApi,
} from '@zerpto/sdk';
import type { ClosePeriodRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new GeneralLedgerApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies ClosePeriodRequest;

  try {
    const data = await api.closePeriod(body);
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

[**PeriodResponse**](PeriodResponse.md)

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
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## listPeriods

> PeriodListResponse listPeriods(perPage, page)

List accounting periods

Lists your accounting periods, with their start and end dates and whether each is open or closed. Use it to see which periods still accept postings, to fill a period picker on reports, or to check whether a date can still be posted to. A period\&#39;s &#x60;closed_at&#x60; is set once it is closed.  Take a period &#x60;id&#x60; from this list to close it with [&#x60;POST /v1/gl/periods/{id}/close&#x60;](#tag/general-ledger/POST/v1/gl/periods/{id}/close). Invoices, payments, deliveries and manual entries made with [&#x60;POST /v1/gl/journal-entries&#x60;](#tag/journal/POST/v1/gl/journal-entries) are posted into the period that contains their date, and the entries already there are listed with [&#x60;GET /v1/gl/journal-entries&#x60;](#tag/journal/GET/v1/gl/journal-entries).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  GeneralLedgerApi,
} from '@zerpto/sdk';
import type { ListPeriodsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new GeneralLedgerApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
  } satisfies ListPeriodsRequest;

  try {
    const data = await api.listPeriods(body);
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

### Return type

[**PeriodListResponse**](PeriodListResponse.md)

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
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

