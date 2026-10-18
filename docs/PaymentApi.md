# PaymentApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**allocateApPayment**](PaymentApi.md#allocateappayment) | **POST** /v1/ap/payments/{id}/allocations | Apply payment to bills |
| [**createApPayment**](PaymentApi.md#createappayment) | **POST** /v1/ap/payments | Record a payment |
| [**getApPayment**](PaymentApi.md#getappayment) | **GET** /v1/ap/payments/{id} | Get payment |
| [**listApPayments**](PaymentApi.md#listappayments) | **GET** /v1/ap/payments | List payments |
| [**removeApPaymentAllocation**](PaymentApi.md#removeappaymentallocation) | **DELETE** /v1/ap/payments/{id}/allocations/{invoice_id} | Remove a payment allocation |



## allocateApPayment

> ApPaymentResponse allocateApPayment(id, allocationsInput, idempotencyKey)

Apply payment to bills

Applies the unallocated balance of a payment to one or more posted bills of the same vendor, with a different amount for each. Use it for a down payment that was recorded without bills, or for any payment that has a balance left. The total cannot exceed the unallocated balance, and each amount cannot exceed the bill\&#39;s &#x60;amount_due&#x60;. It posts debit AP and credit vendor advances for the applied amount, and fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  The payment comes from [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments) or [&#x60;GET /v1/ap/payments&#x60;](#tag/payment/GET/v1/ap/payments), and its &#x60;unallocated_amount&#x60; shows what can be applied. The bills must be posted with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm); find them with [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices). Undo one allocation with [&#x60;DELETE /v1/ap/payments/{id}/allocations/{invoice_id}&#x60;](#tag/payment/DELETE/v1/ap/payments/{id}/allocations/{invoice_id}). To reduce a bill with a credit note instead of a payment, use [&#x60;POST /v1/ap/credit-notes/{id}/allocations&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/allocations).  Error codes: &#x60;exceeds_unallocated&#x60;, &#x60;exceeds_amount_due&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;invoice_not_posted&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { AllocateApPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // AllocationsInput
    allocationsInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies AllocateApPaymentRequest;

  try {
    const data = await api.allocateApPayment(body);
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
| **allocationsInput** | [AllocationsInput](AllocationsInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApPaymentResponse**](ApPaymentResponse.md)

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


## createApPayment

> ApPaymentResponse createApPayment(apPaymentInput, idempotencyKey)

Record a payment

Records a payment to a vendor. Send the &#x60;vendor_id&#x60;, the &#x60;payment_date&#x60;, the &#x60;currency&#x60;, the &#x60;amount&#x60; and the &#x60;bank_account_id&#x60; the money left from; the &#x60;method&#x60; and a &#x60;reference&#x60; are optional. List the bills it pays in &#x60;allocations&#x60;, each with its own amount, so one payment can settle several bills. The sum of the allocations cannot exceed the amount, and what is left stays as an unallocated balance. It posts to the GL immediately and reduces &#x60;amount_due&#x60; on the bills. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the vendor from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), the bills from [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices) (they must be posted, with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm), and belong to the vendor), and the bank account from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). Allocations are optional: a payment with none, usually with a &#x60;purchase_order_id&#x60; from [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}), is a down payment held as a vendor advance. Apply it later with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations), or set &#x60;apply_down_payments&#x60; on the bill.  Error codes: &#x60;unknown_vendor&#x60;, &#x60;unknown_bank_account&#x60;, &#x60;unknown_invoice&#x60;, &#x60;invoice_not_posted&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;allocations_exceed_amount&#x60;, &#x60;exceeds_amount_due&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { CreateApPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentApi(config);

  const body = {
    // ApPaymentInput
    apPaymentInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateApPaymentRequest;

  try {
    const data = await api.createApPayment(body);
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
| **apPaymentInput** | [ApPaymentInput](ApPaymentInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApPaymentResponse**](ApPaymentResponse.md)

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


## getApPayment

> ApPaymentResponse getApPayment(id)

Get payment

Returns one vendor payment by its &#x60;id&#x60;, with the vendor, date, currency, amount, method, reference, bank account, purchase order for a down payment, every allocation, the unallocated amount and the journal entry. Use it to show a payment, to see which bills it paid, or to check how much of a down payment is still available.  Take the &#x60;id&#x60; from [&#x60;GET /v1/ap/payments&#x60;](#tag/payment/GET/v1/ap/payments) or from the response of [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments). An unallocated balance is applied to bills with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations), and one allocation is taken back with [&#x60;DELETE /v1/ap/payments/{id}/allocations/{invoice_id}&#x60;](#tag/payment/DELETE/v1/ap/payments/{id}/allocations/{invoice_id}). The bills named in &#x60;allocations&#x60; are read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { GetApPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetApPaymentRequest;

  try {
    const data = await api.getApPayment(body);
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

[**ApPaymentResponse**](ApPaymentResponse.md)

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


## listApPayments

> ApPaymentListResponse listApPayments(perPage, page, sort, createdAfter, createdBefore, vendorId, purchaseOrderId, hasUnallocated)

List payments

Lists the payments you made to vendors, with the amount, date, method, reference, the bills each one was applied to, and the part not yet applied. Use it to review what you paid, to reconcile with the bank, or to find down payments that still hold a balance. Filter by &#x60;vendor_id&#x60;, by &#x60;purchase_order_id&#x60; for down payments, or by &#x60;has_unallocated&#x3D;true&#x60; for payments with a balance left, and narrow by creation date.  Take a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). New payments are recorded with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments), and one payment is read with [&#x60;GET /v1/ap/payments/{id}&#x60;](#tag/payment/GET/v1/ap/payments/{id}). A payment with a balance left is applied to bills with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations). The bills it paid are read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { ListApPaymentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentApi(config);

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
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
    // string | Only payments made against this purchase order (down payments). (optional)
    purchaseOrderId: purchaseOrderId_example,
    // boolean | True returns payments with an unallocated balance. (optional)
    hasUnallocated: true,
  } satisfies ListApPaymentsRequest;

  try {
    const data = await api.listApPayments(body);
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
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |
| **purchaseOrderId** | `string` | Only payments made against this purchase order (down payments). | [Optional] [Defaults to `undefined`] |
| **hasUnallocated** | `boolean` | True returns payments with an unallocated balance. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApPaymentListResponse**](ApPaymentListResponse.md)

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


## removeApPaymentAllocation

> removeApPaymentAllocation(id, invoiceId)

Remove a payment allocation

Takes back one allocation of a payment from a bill. The amount returns to the payment\&#39;s unallocated balance and the bill\&#39;s &#x60;amount_due&#x60; is restored, so the bill is open again. Use it when a payment was applied to the wrong bill. The call returns 204 with no body, and it fails with 422 if the period of the allocation is closed.  The &#x60;id&#x60; is the payment from [&#x60;GET /v1/ap/payments/{id}&#x60;](#tag/payment/GET/v1/ap/payments/{id}) and the &#x60;invoice_id&#x60; is the bill named in its &#x60;allocations&#x60;. After removing, apply the balance again with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations). If the whole bill was recorded by mistake, a bill that still has payments allocated cannot be voided with [&#x60;POST /v1/ap/invoices/{id}/void&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/void) until its allocations are removed.  Error codes: &#x60;allocation_not_found&#x60;, &#x60;period_closed&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { RemoveApPaymentAllocationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Bill the allocation is on.
    invoiceId: invoiceId_example,
  } satisfies RemoveApPaymentAllocationRequest;

  try {
    const data = await api.removeApPaymentAllocation(body);
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
| **invoiceId** | `string` | Bill the allocation is on. | [Defaults to `undefined`] |

### Return type

`void` (Empty response body)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | No content |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

