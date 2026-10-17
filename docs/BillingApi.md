# BillingApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelSubscription**](BillingApi.md#cancelsubscription) | **DELETE** /v1/billing/subscription | Cancel at period end |
| [**createCheckout**](BillingApi.md#createcheckout) | **POST** /v1/billing/checkout | Pay an invoice on Xendit |
| [**createSubscription**](BillingApi.md#createsubscription) | **POST** /v1/billing/subscription | Subscribe to a plan |
| [**deletePaymentMethod**](BillingApi.md#deletepaymentmethod) | **DELETE** /v1/billing/payment-methods/{id} | Remove a saved method |
| [**getBillingInvoice**](BillingApi.md#getbillinginvoice) | **GET** /v1/billing/invoices/{id} | Get subscription invoice |
| [**getSubscription**](BillingApi.md#getsubscription) | **GET** /v1/billing/subscription | Get current plan and add-ons |
| [**listBillingInvoices**](BillingApi.md#listbillinginvoices) | **GET** /v1/billing/invoices | List subscription invoices |
| [**listBillingPayments**](BillingApi.md#listbillingpayments) | **GET** /v1/billing/payments | List payment history |
| [**listPaymentMethods**](BillingApi.md#listpaymentmethods) | **GET** /v1/billing/payment-methods | List saved payment methods |
| [**receiveXenditWebhook**](BillingApi.md#receivexenditwebhook) | **POST** /v1/billing/webhooks/xendit | Receive Xendit payment events |
| [**updateSubscription**](BillingApi.md#updatesubscription) | **PATCH** /v1/billing/subscription | Change plan, seats or add-on |



## cancelSubscription

> SubscriptionResponse cancelSubscription(idempotencyKey)

Cancel at period end

Cancels the subscription at the end of the current period. The tenant keeps full access until &#x60;current_period_end&#x60;, then becomes read-only, and its data stays available for export and is not deleted. Calling it again on a subscription that is already being cancelled returns 200 and changes nothing.  After this call [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription) shows &#x60;cancel_at_period_end&#x60; as true, and no further invoices are created or charged. A subscription that is already &#x60;canceled&#x60; has nothing to cancel. Send an &#x60;Idempotency-Key&#x60; header so a retry is safe.  Error codes: &#x60;subscription_not_active&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { CancelSubscriptionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelSubscriptionRequest;

  try {
    const data = await api.cancelSubscription(body);
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
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**SubscriptionResponse**](SubscriptionResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Cancellation scheduled |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createCheckout

> CheckoutResponse createCheckout(checkoutInput, idempotencyKey)

Pay an invoice on Xendit

Starts a payment for an open subscription invoice and returns the address of a payment page hosted by Xendit. Redirect the person to it. They choose how to pay on that page, such as an e-wallet like GoPay or OVO, QRIS, a bank virtual account or a card, and for a method that can be saved (an e-wallet or a card) they can choose to save it for the next period. No card or account data passes through this API.  The invoice id comes from [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices). Each call creates a new payment attempt with its own &#x60;payment_url&#x60;, which stops working at &#x60;expires_at&#x60;. The redirect back to your site is not proof of payment: the payment becomes &#x60;paid&#x60; when Xendit confirms it through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit). Follow it with [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments). A saved method is listed by [&#x60;GET /v1/billing/payment-methods&#x60;](#tag/billing/GET/v1/billing/payment-methods), and from then on renewals are charged to it without calling this. Send an &#x60;Idempotency-Key&#x60; header so a retry does not create two attempts.  Error codes: &#x60;invoice_not_payable&#x60; (already paid or void).  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { CreateCheckoutRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // CheckoutInput
    checkoutInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCheckoutRequest;

  try {
    const data = await api.createCheckout(body);
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
| **checkoutInput** | [CheckoutInput](CheckoutInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CheckoutResponse**](CheckoutResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Payment created |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createSubscription

> SubscriptionResponse createSubscription(subscribeInput, idempotencyKey)

Subscribe to a plan

Subscribes the current tenant to a plan and a billing cycle. The subscription starts as &#x60;trialing&#x60;, so the tenant uses the service straight away and pays later: the first invoice is created at the same time and falls due when the trial ends. &#x60;seats&#x60; defaults to the number of active users, or to the seats the plan includes if that is higher.  Plan ids and prices come from [&#x60;GET /v1/plans&#x60;](#tag/plans/GET/v1/plans). When the invoice is due, pay it with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout). The first confirmed payment moves the subscription to &#x60;active&#x60;, and the confirmation arrives through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit). Send an &#x60;Idempotency-Key&#x60; header so a retry does not subscribe twice.  Error codes: &#x60;subscription_exists&#x60;, &#x60;unknown_plan&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { CreateSubscriptionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // SubscribeInput
    subscribeInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateSubscriptionRequest;

  try {
    const data = await api.createSubscription(body);
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
| **subscribeInput** | [SubscribeInput](SubscribeInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**SubscriptionResponse**](SubscriptionResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Subscription created |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## deletePaymentMethod

> deletePaymentMethod(id)

Remove a saved method

Removes a saved payment method, so it is not charged again. Use it when the person stops using that e-wallet, or wants to pay each invoice by hand. If it was the method used for renewals, the next newest &#x60;active&#x60; method takes over, and when there is none, each invoice has to be paid by hand.  The id comes from [&#x60;GET /v1/billing/payment-methods&#x60;](#tag/billing/GET/v1/billing/payment-methods). Payments already made with it stay in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments). To pay an invoice yourself, use [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout).  Error codes: &#x60;payment_method_not_found&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { DeletePaymentMethodRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies DeletePaymentMethodRequest;

  try {
    const data = await api.deletePaymentMethod(body);
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
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getBillingInvoice

> BillingInvoiceDetailResponse getBillingInvoice(id)

Get subscription invoice

Returns one subscription invoice in full: its lines, subtotal, PPN, total, billing period, due date, the time it was paid and a link to the PDF. Use it to show an invoice to the person, or to let them download it.  The id comes from [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices). If the status is &#x60;open&#x60;, pay it with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout); the attempts made so far are in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { GetBillingInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetBillingInvoiceRequest;

  try {
    const data = await api.getBillingInvoice(body);
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

[**BillingInvoiceDetailResponse**](BillingInvoiceDetailResponse.md)

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


## getSubscription

> SubscriptionResponse getSubscription()

Get current plan and add-ons

Returns the subscription of the current tenant: its plan, status, billing cycle, number of seats, whether paid API access is on, when the current period ends, when the trial ends during a trial, and the saved payment method charged for renewals. Use it to build the plan page, or to decide what a tenant may still do: a &#x60;past_due&#x60; or &#x60;canceled&#x60; subscription makes the tenant read-only.  A subscription is created with [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription), changed with [&#x60;PATCH /v1/billing/subscription&#x60;](#tag/billing/PATCH/v1/billing/subscription) and cancelled with [&#x60;DELETE /v1/billing/subscription&#x60;](#tag/billing/DELETE/v1/billing/subscription). The invoices behind it are listed by [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices), and the saved payment methods by [&#x60;GET /v1/billing/payment-methods&#x60;](#tag/billing/GET/v1/billing/payment-methods).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { GetSubscriptionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  try {
    const data = await api.getSubscription();
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

[**SubscriptionResponse**](SubscriptionResponse.md)

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


## listBillingInvoices

> BillingInvoiceListResponse listBillingInvoices(status, perPage, page)

List subscription invoices

Lists the subscription invoices of the current tenant. Each one is the full invoice: its number, status (&#x60;open&#x60;, &#x60;paid&#x60; or &#x60;void&#x60;), billing period, due date, lines, PPN, total and a link to the PDF. Use it for the billing history page, or to find the invoice that has to be paid: filter with &#x60;status&#x3D;open&#x60;.  A single invoice is returned by [&#x60;GET /v1/billing/invoices/{id}&#x60;](#tag/billing/GET/v1/billing/invoices/{id}) in the same shape as the items of this list. Pay an open one with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout), and see what was paid in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { ListBillingInvoicesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // 'open' | 'paid' | 'void' | Only invoices with this status. Omit it to get every status. (optional)
    status: status_example,
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
  } satisfies ListBillingInvoicesRequest;

  try {
    const data = await api.listBillingInvoices(body);
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
| **status** | `open`, `paid`, `void` | Only invoices with this status. Omit it to get every status. | [Optional] [Defaults to `undefined`] [Enum: open, paid, void] |
| **perPage** | `number` | Page size. | [Optional] [Defaults to `25`] |
| **page** | `number` | Page number, starting at 1. | [Optional] [Defaults to `1`] |

### Return type

[**BillingInvoiceListResponse**](BillingInvoiceListResponse.md)

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


## listBillingPayments

> BillingPaymentListResponse listBillingPayments(perPage, page, invoiceId)

List payment history

Lists the payment attempts for subscription invoices, with their amount, how they were paid (&#x60;method&#x60; and &#x60;channel&#x60;), whether the person paid on the payment page or Zerpto charged a saved method (&#x60;source&#x60;), status (&#x60;pending&#x60;, &#x60;paid&#x60;, &#x60;expired&#x60; or &#x60;failed&#x60;) and time. One invoice can have several attempts, for example an expired payment page followed by a new one. Filter with &#x60;invoice_id&#x60; to see the attempts for one invoice.  Every attempt is created by [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout), and its status is updated when Xendit reports back through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit). The invoice itself is shown by [&#x60;GET /v1/billing/invoices/{id}&#x60;](#tag/billing/GET/v1/billing/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { ListBillingPaymentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Filter by invoice. (optional)
    invoiceId: invoiceId_example,
  } satisfies ListBillingPaymentsRequest;

  try {
    const data = await api.listBillingPayments(body);
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
| **invoiceId** | `string` | Filter by invoice. | [Optional] [Defaults to `undefined`] |

### Return type

[**BillingPaymentListResponse**](BillingPaymentListResponse.md)

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


## listPaymentMethods

> PaymentMethodListResponse listPaymentMethods(perPage, page)

List saved payment methods

Lists the payment methods the tenant has saved for renewals, such as an e-wallet linked on the Xendit payment page. Each one shows its type, channel, a masked label, its status (&#x60;active&#x60;, &#x60;invalid&#x60; or &#x60;expired&#x60;), when it expires and when it was last used. Use it for the billing settings page.  A method is saved when the person ticks the option to save it on the payment page opened by [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout). The newest &#x60;active&#x60; method is charged automatically for each renewal, and [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription) shows which one in &#x60;payment_method_id&#x60;. To stop using one, call [&#x60;DELETE /v1/billing/payment-methods/{id}&#x60;](#tag/billing/DELETE/v1/billing/payment-methods/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { ListPaymentMethodsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
  } satisfies ListPaymentMethodsRequest;

  try {
    const data = await api.listPaymentMethods(body);
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

[**PaymentMethodListResponse**](PaymentMethodListResponse.md)

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


## receiveXenditWebhook

> receiveXenditWebhook(xCALLBACKTOKEN, requestBody)

Receive Xendit payment events

Receives payment events from Xendit. Xendit calls it when a payment page is completed or expires, when a saved payment method becomes active, fails or expires, and when an automatic renewal charge succeeds or fails. Zerpto then updates the payment, the invoice and the saved method, and moves the subscription to &#x60;active&#x60; when an invoice is paid. It is meant for Xendit only, not for your own code, and it is the only way a payment becomes &#x60;paid&#x60;. If Zerpto adds another payment provider, that provider gets its own endpoint next to this one.  Xendit reports on every payment page created by [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout) and on every automatic renewal charge, and the outcome shows up in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments), [&#x60;GET /v1/billing/invoices/{id}&#x60;](#tag/billing/GET/v1/billing/invoices/{id}) and [&#x60;GET /v1/billing/payment-methods&#x60;](#tag/billing/GET/v1/billing/payment-methods). The call is not tenant-authenticated: the &#x60;X-CALLBACK-TOKEN&#x60; header carries the callback token set up in Xendit, and a wrong token is rejected with 401. Handling is idempotent on the Xendit ids, so duplicate, late and out-of-order calls are safe, and any verified call gets 200 even when nothing changes, so that Xendit stops retrying.  Error codes: none specific.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { ReceiveXenditWebhookRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new BillingApi();

  const body = {
    // string | Xendit callback token. Compared with the token configured for this account in Xendit.
    xCALLBACKTOKEN: xCALLBACKTOKEN_example,
    // { [key: string]: any; }
    requestBody: Object,
  } satisfies ReceiveXenditWebhookRequest;

  try {
    const data = await api.receiveXenditWebhook(body);
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
| **xCALLBACKTOKEN** | `string` | Xendit callback token. Compared with the token configured for this account in Xendit. | [Defaults to `undefined`] |
| **requestBody** | `{ [key: string]: any; }` |  | |

### Return type

`void` (Empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Acknowledged |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateSubscription

> SubscriptionResponse updateSubscription(subscriptionUpdate)

Change plan, seats or add-on

Changes the plan, billing cycle, number of seats or paid API access of the current subscription. Send only the fields you want to change. Use it when a team grows, moves to a bigger plan, or switches between monthly and annual. A change that costs more produces an invoice for the difference.  Plans and prices come from [&#x60;GET /v1/plans&#x60;](#tag/plans/GET/v1/plans). An invoice created by a change shows up in [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices) and is paid with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout). To stop the subscription instead of changing it, call [&#x60;DELETE /v1/billing/subscription&#x60;](#tag/billing/DELETE/v1/billing/subscription).  Error codes: &#x60;unknown_plan&#x60;, &#x60;subscription_not_active&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { UpdateSubscriptionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BillingApi(config);

  const body = {
    // SubscriptionUpdate
    subscriptionUpdate: ...,
  } satisfies UpdateSubscriptionRequest;

  try {
    const data = await api.updateSubscription(body);
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
| **subscriptionUpdate** | [SubscriptionUpdate](SubscriptionUpdate.md) |  | |

### Return type

[**SubscriptionResponse**](SubscriptionResponse.md)

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
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

