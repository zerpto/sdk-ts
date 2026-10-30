# PaymentApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**allocateApPayment**](PaymentApi.md#allocateappayment) | **POST** /v1/ap/payments/{id}/allocations | Apply payment to bills |
| [**cancelApPayment**](PaymentApi.md#cancelappayment) | **POST** /v1/ap/payments/{id}/cancel | Cancel payment |
| [**createApPayment**](PaymentApi.md#createappayment) | **POST** /v1/ap/payments | Record a payment |
| [**getApPayment**](PaymentApi.md#getappayment) | **GET** /v1/ap/payments/{id} | Get payment |
| [**listApPayments**](PaymentApi.md#listappayments) | **GET** /v1/ap/payments | List payments |
| [**postApPayment**](PaymentApi.md#postappayment) | **POST** /v1/ap/payments/{id}/confirm | Post payment to the GL |
| [**removeApPaymentAllocation**](PaymentApi.md#removeappaymentallocation) | **DELETE** /v1/ap/payments/{id}/allocations/{invoice_id} | Remove a payment allocation |
| [**updateApPayment**](PaymentApi.md#updateappayment) | **PATCH** /v1/ap/payments/{id} | Update payment |
| [**voidApPayment**](PaymentApi.md#voidappayment) | **POST** /v1/ap/payments/{id}/void | Void payment |



## allocateApPayment

> ApPaymentResponse allocateApPayment(id, allocationsInput, idempotencyKey)

Apply payment to bills

Applies the unallocated balance of a posted payment to one or more posted bills of the same vendor, with a different amount for each. Use it for a down payment that was recorded without bills, or for any payment that has a balance left. The total cannot exceed the unallocated balance, and each amount cannot exceed the bill\&#39;s &#x60;amount_due&#x60;. It posts debit AP and credit vendor advances for the applied amount, and fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  The payment comes from [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments) or [&#x60;GET /v1/ap/payments&#x60;](#tag/payment/GET/v1/ap/payments), and must already be posted with [&#x60;POST /v1/ap/payments/{id}/confirm&#x60;](#tag/payment/POST/v1/ap/payments/{id}/confirm); its &#x60;unallocated_amount&#x60; shows what can be applied. The bills must be posted with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm); find them with [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices). Undo one allocation with [&#x60;DELETE /v1/ap/payments/{id}/allocations/{invoice_id}&#x60;](#tag/payment/DELETE/v1/ap/payments/{id}/allocations/{invoice_id}). To reduce a bill with a credit note instead of a payment, use [&#x60;POST /v1/ap/credit-notes/{id}/allocations&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/allocations).  Error codes: &#x60;payment_not_posted&#x60;, &#x60;exceeds_unallocated&#x60;, &#x60;exceeds_amount_due&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;invoice_not_posted&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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


## cancelApPayment

> ApPaymentResponse cancelApPayment(id, idempotencyKey)

Cancel payment

Cancels a draft payment that you no longer want to record. The payment becomes &#x60;cancelled&#x60;, nothing posts to the GL and no bill is affected. Only drafts can be cancelled this way; to reverse a posted payment, use the void call instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments) or [&#x60;PATCH /v1/ap/payments/{id}&#x60;](#tag/payment/PATCH/v1/ap/payments/{id}). Once you have called [&#x60;POST /v1/ap/payments/{id}/confirm&#x60;](#tag/payment/POST/v1/ap/payments/{id}/confirm), the payment is posted and [&#x60;POST /v1/ap/payments/{id}/void&#x60;](#tag/payment/POST/v1/ap/payments/{id}/void) is the way to reverse it. A cancelled payment stays in [&#x60;GET /v1/ap/payments&#x60;](#tag/payment/GET/v1/ap/payments) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;payment_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { CancelApPaymentRequest } from '@zerpto/sdk';

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
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelApPaymentRequest;

  try {
    const data = await api.cancelApPayment(body);
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
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createApPayment

> ApPaymentResponse createApPayment(apPaymentInput, idempotencyKey)

Record a payment

Records a payment to a vendor, as a draft. Send the &#x60;vendor_id&#x60;, the &#x60;payment_date&#x60;, the &#x60;currency&#x60;, the &#x60;amount&#x60; and &#x60;paid_via&#x60;; the &#x60;method&#x60; and a &#x60;reference&#x60; are optional. &#x60;paid_via&#x60; is a &#x60;cash_account_id&#x60; when the money left straight away, or a &#x60;credit_card_id&#x60; when the bill was charged to a card instead, in which case no cash moves until the card is paid down. List the bills it is meant to pay in &#x60;allocations&#x60;, each with its own amount, so one payment can settle several bills; the sum of the allocations cannot exceed the amount, and what is left stays as an unallocated balance. Nothing posts to the GL and no bill is affected until the draft is confirmed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the vendor from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), the bills from [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices), and the cash account from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts) or the credit card from [&#x60;GET /v1/credit-cards&#x60;](#tag/credit-card/GET/v1/credit-cards). Allocations are optional: a payment with none, usually with a &#x60;purchase_order_id&#x60; from [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}), is a down payment held as a vendor advance once confirmed. While still a draft, change it with [&#x60;PATCH /v1/ap/payments/{id}&#x60;](#tag/payment/PATCH/v1/ap/payments/{id}) or drop it with [&#x60;POST /v1/ap/payments/{id}/cancel&#x60;](#tag/payment/POST/v1/ap/payments/{id}/cancel); when it is ready, post it with [&#x60;POST /v1/ap/payments/{id}/confirm&#x60;](#tag/payment/POST/v1/ap/payments/{id}/confirm). A card charge is paid down later with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments).  Error codes: &#x60;unknown_vendor&#x60;, &#x60;funding_source_required&#x60;, &#x60;funding_source_conflict&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;unknown_credit_card&#x60;, &#x60;credit_card_archived&#x60;, &#x60;vendor_mismatch&#x60; (the purchase order\&#39;s vendor does not match).  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns one vendor payment by its &#x60;id&#x60;, with the vendor, date, currency, amount, method, reference, &#x60;paid_via&#x60;, purchase order for a down payment, status, every allocation, the unallocated amount and the journal entry. Use it to show a payment, to see whether it is still a draft, to see which bills it paid, or to check how much of a down payment is still available.  Take the &#x60;id&#x60; from [&#x60;GET /v1/ap/payments&#x60;](#tag/payment/GET/v1/ap/payments) or from the response of [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments). While it is a draft, change it with [&#x60;PATCH /v1/ap/payments/{id}&#x60;](#tag/payment/PATCH/v1/ap/payments/{id}) or drop it with [&#x60;POST /v1/ap/payments/{id}/cancel&#x60;](#tag/payment/POST/v1/ap/payments/{id}/cancel); post it with [&#x60;POST /v1/ap/payments/{id}/confirm&#x60;](#tag/payment/POST/v1/ap/payments/{id}/confirm). Once posted, an unallocated balance is applied to bills with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations), one allocation is taken back with [&#x60;DELETE /v1/ap/payments/{id}/allocations/{invoice_id}&#x60;](#tag/payment/DELETE/v1/ap/payments/{id}/allocations/{invoice_id}), and the whole payment is reversed with [&#x60;POST /v1/ap/payments/{id}/void&#x60;](#tag/payment/POST/v1/ap/payments/{id}/void). The bills named in &#x60;allocations&#x60; are read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

> ApPaymentListResponse listApPayments(perPage, page, sort, createdAfter, createdBefore, vendorId, status, purchaseOrderId, hasUnallocated)

List payments

Lists the payments you made to vendors, with the amount, date, method, reference, the bills each one was applied to, and the part not yet applied. Use it to review what you paid, to reconcile with the bank, to find drafts not yet posted, or to find down payments that still hold a balance. Filter by &#x60;vendor_id&#x60;, &#x60;status&#x60;, by &#x60;purchase_order_id&#x60; for down payments, or by &#x60;has_unallocated&#x3D;true&#x60; for payments with a balance left, and narrow by creation date.  Take a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). New payments are recorded with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments), and one payment is read with [&#x60;GET /v1/ap/payments/{id}&#x60;](#tag/payment/GET/v1/ap/payments/{id}). A payment with a balance left is applied to bills with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations). The bills it paid are read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

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
    // 'draft' | 'posted' | 'void' | Filter by status. (optional)
    status: status_example,
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
| **status** | `draft`, `posted`, `void` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted, void] |
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


## postApPayment

> ApPaymentResponse postApPayment(id, idempotencyKey)

Post payment to the GL

Posts a draft payment. It creates the journal entry, crediting &#x60;paid_via&#x60;\&#39;s cash account with the amount, or its credit card\&#39;s liability account if it was charged instead, applies &#x60;allocations&#x60; to the named bills (reducing each &#x60;amount_due&#x60;), sets the status to &#x60;posted&#x60;, and locks the payment, so it can no longer be edited with &#x60;PATCH&#x60;. The call fails with 422 if the period is closed, or if &#x60;paid_via.credit_card_id&#x60; is set and posting would put the card over its &#x60;credit_limit&#x60;. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the draft with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments) and [&#x60;PATCH /v1/ap/payments/{id}&#x60;](#tag/payment/PATCH/v1/ap/payments/{id}) first; the bills in &#x60;allocations&#x60; must be posted, with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm), and belong to the vendor. After posting, apply any remaining unallocated balance with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations), pay down a card charge with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments), or reverse the payment with [&#x60;POST /v1/ap/payments/{id}/void&#x60;](#tag/payment/POST/v1/ap/payments/{id}/void).  Error codes: &#x60;payment_not_draft&#x60;, &#x60;unknown_invoice&#x60;, &#x60;invoice_not_posted&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;allocations_exceed_amount&#x60;, &#x60;exceeds_amount_due&#x60;, &#x60;period_closed&#x60;, &#x60;credit_limit_exceeded&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { PostApPaymentRequest } from '@zerpto/sdk';

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
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostApPaymentRequest;

  try {
    const data = await api.postApPayment(body);
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
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## removeApPaymentAllocation

> removeApPaymentAllocation(id, invoiceId)

Remove a payment allocation

Takes back one allocation of a payment from a bill. The amount returns to the payment\&#39;s unallocated balance and the bill\&#39;s &#x60;amount_due&#x60; is restored, so the bill is open again. Use it when a payment was applied to the wrong bill. The call returns 204 with no body, and it fails with 422 if the period of the allocation is closed.  The &#x60;id&#x60; is the payment from [&#x60;GET /v1/ap/payments/{id}&#x60;](#tag/payment/GET/v1/ap/payments/{id}) and the &#x60;invoice_id&#x60; is the bill named in its &#x60;allocations&#x60;. After removing, apply the balance again with [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations), or void the whole payment with [&#x60;POST /v1/ap/payments/{id}/void&#x60;](#tag/payment/POST/v1/ap/payments/{id}/void). If the whole bill was recorded by mistake, a bill that still has payments allocated cannot be voided with [&#x60;POST /v1/ap/invoices/{id}/void&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/void) until its allocations are removed.  Error codes: &#x60;payment_not_posted&#x60;, &#x60;allocation_not_found&#x60;, &#x60;period_closed&#x60;.  **Response meta** - No response body, so no meta. 

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


## updateApPayment

> ApPaymentResponse updateApPayment(id, apPaymentUpdate)

Update payment

Changes a payment that is still a draft. Send only the fields you want to change. When you send &#x60;allocations&#x60;, the whole list replaces the old one, so include every allocation you want to keep. Once the payment is posted or void it can no longer be edited, and the call returns 409.  Read the current draft with [&#x60;GET /v1/ap/payments/{id}&#x60;](#tag/payment/GET/v1/ap/payments/{id}) first. When it is ready, post it with [&#x60;POST /v1/ap/payments/{id}/confirm&#x60;](#tag/payment/POST/v1/ap/payments/{id}/confirm). To drop it, call [&#x60;POST /v1/ap/payments/{id}/cancel&#x60;](#tag/payment/POST/v1/ap/payments/{id}/cancel).  Error codes: &#x60;payment_not_editable&#x60;, &#x60;unknown_vendor&#x60;, &#x60;funding_source_required&#x60;, &#x60;funding_source_conflict&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;unknown_credit_card&#x60;, &#x60;credit_card_archived&#x60;, &#x60;vendor_mismatch&#x60; (the purchase order\&#39;s vendor does not match).  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { UpdateApPaymentRequest } from '@zerpto/sdk';

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
    // ApPaymentUpdate
    apPaymentUpdate: ...,
  } satisfies UpdateApPaymentRequest;

  try {
    const data = await api.updateApPayment(body);
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
| **apPaymentUpdate** | [ApPaymentUpdate](ApPaymentUpdate.md) |  | |

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


## voidApPayment

> ApPaymentResponse voidApPayment(id, idempotencyKey)

Void payment

Voids a posted payment by reversing its journal entry. The status becomes &#x60;void&#x60;, every allocation it made is removed, and the &#x60;amount_due&#x60; of each bill it had paid is restored, so they are open again. Use it when a payment was recorded by mistake, with the wrong amount, account or funding source, or has to be redone. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Read the payment first with [&#x60;GET /v1/ap/payments/{id}&#x60;](#tag/payment/GET/v1/ap/payments/{id}) to see which bills it paid. After voiding, record the right payment with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments). A void payment stays in [&#x60;GET /v1/ap/payments&#x60;](#tag/payment/GET/v1/ap/payments) with the status &#x60;void&#x60;.  Error codes: &#x60;payment_not_voidable&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PaymentApi,
} from '@zerpto/sdk';
import type { VoidApPaymentRequest } from '@zerpto/sdk';

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
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidApPaymentRequest;

  try {
    const data = await api.voidApPayment(body);
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
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

