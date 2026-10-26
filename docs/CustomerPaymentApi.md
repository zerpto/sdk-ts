# CustomerPaymentApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createArPayment**](CustomerPaymentApi.md#createarpayment) | **POST** /v1/ar/payments | Record a payment |
| [**getArPayment**](CustomerPaymentApi.md#getarpayment) | **GET** /v1/ar/payments/{id} | Get payment |
| [**listArPayments**](CustomerPaymentApi.md#listarpayments) | **GET** /v1/ar/payments | List payments |



## createArPayment

> ArPaymentResponse createArPayment(arPaymentInput, idempotencyKey)

Record a payment

Records money received from a customer and applies it to invoices. Send the &#x60;customer_id&#x60;, the &#x60;payment_date&#x60;, the &#x60;currency&#x60;, the &#x60;amount&#x60;, the &#x60;cash_account_id&#x60; it was paid into and the &#x60;allocations&#x60;, each with an &#x60;invoice_id&#x60; and the amount applied. The allocations must not add up to more than the &#x60;amount&#x60;. The payment is posted to the ledger at once and lowers the &#x60;amount_due&#x60; of every invoice it is applied to. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;customer_id&#x60; from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers) and the posted invoices to settle from [&#x60;GET /v1/ar/invoices&#x60;](#tag/customer-invoice/GET/v1/ar/invoices); a draft invoice cannot be paid, so post it first with [&#x60;POST /v1/ar/invoices/{id}/confirm&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/confirm). Take the &#x60;cash_account_id&#x60; from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts). Each invoice moves to &#x60;partially_paid&#x60; or &#x60;paid&#x60;, which you can check with [&#x60;GET /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/GET/v1/ar/invoices/{id}). If an invoice was paid by mistake, it cannot be voided with [&#x60;POST /v1/ar/invoices/{id}/void&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/void) while a payment is allocated to it.  Error codes: &#x60;unknown_customer&#x60;, &#x60;unknown_invoice&#x60;, &#x60;invoice_not_payable&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;allocation_exceeds_amount&#x60;, &#x60;allocation_exceeds_amount_due&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerPaymentApi,
} from '@zerpto/sdk';
import type { CreateArPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerPaymentApi(config);

  const body = {
    // ArPaymentInput
    arPaymentInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateArPaymentRequest;

  try {
    const data = await api.createArPayment(body);
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
| **arPaymentInput** | [ArPaymentInput](ArPaymentInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ArPaymentResponse**](ArPaymentResponse.md)

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
| **403** | The key or user lacks permission for this action. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getArPayment

> ArPaymentResponse getArPayment(id)

Get payment

Returns one customer payment by its &#x60;id&#x60;, with the customer, date, amount, method, reference, bank account and the allocations to invoices. Once recorded, &#x60;journal_entry_id&#x60; points to the entry it booked. Use it to show the payment, to see which invoices it settled, or to trace it back to the ledger.  Take the &#x60;id&#x60; from [&#x60;GET /v1/ar/payments&#x60;](#tag/customer-payment/GET/v1/ar/payments) or from the response of [&#x60;POST /v1/ar/payments&#x60;](#tag/customer-payment/POST/v1/ar/payments). Each allocation names an &#x60;invoice_id&#x60;, which you can read with [&#x60;GET /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/GET/v1/ar/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerPaymentApi,
} from '@zerpto/sdk';
import type { GetArPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerPaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetArPaymentRequest;

  try {
    const data = await api.getArPayment(body);
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

[**ArPaymentResponse**](ArPaymentResponse.md)

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


## listArPayments

> ArPaymentListResponse listArPayments(perPage, page, sort, createdAfter, createdBefore, customerId)

List payments

Lists the payments you have recorded from customers, with date, amount, method, the bank account and how each payment was allocated to invoices. Use it to reconcile what came in, to see which invoices a payment settled, or to review one customer\&#39;s payment history. Filter by &#x60;customer_id&#x60; and narrow by creation date.  Get a &#x60;customer_id&#x60; for the filter from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). New payments are recorded with [&#x60;POST /v1/ar/payments&#x60;](#tag/customer-payment/POST/v1/ar/payments) and one payment is read with [&#x60;GET /v1/ar/payments/{id}&#x60;](#tag/customer-payment/GET/v1/ar/payments/{id}). The invoices a payment settles are listed with [&#x60;GET /v1/ar/invoices&#x60;](#tag/customer-invoice/GET/v1/ar/invoices).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CustomerPaymentApi,
} from '@zerpto/sdk';
import type { ListArPaymentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerPaymentApi(config);

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
    // string | Filter by customer. (optional)
    customerId: customerId_example,
  } satisfies ListArPaymentsRequest;

  try {
    const data = await api.listArPayments(body);
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
| **customerId** | `string` | Filter by customer. | [Optional] [Defaults to `undefined`] |

### Return type

[**ArPaymentListResponse**](ArPaymentListResponse.md)

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

