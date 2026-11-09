# BillingApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**addSeats**](BillingApi.md#addseats) | **POST** /v1/billing/seat-additions | Add seats now |
| [**cancelSubscription**](BillingApi.md#cancelsubscription) | **DELETE** /v1/billing/subscription | Cancel at period end |
| [**createCheckout**](BillingApi.md#createcheckout) | **POST** /v1/billing/checkout | Pay an invoice on Xendit |
| [**createCreditRefund**](BillingApi.md#createcreditrefund) | **POST** /v1/billing/credit/refunds | Refund the credit |
| [**createCreditTopUp**](BillingApi.md#createcredittopup) | **POST** /v1/billing/credit/top-ups | Top up the credit |
| [**createSubscription**](BillingApi.md#createsubscription) | **POST** /v1/billing/subscription | Subscribe with seats |
| [**deletePaymentMethod**](BillingApi.md#deletepaymentmethod) | **DELETE** /v1/billing/payment-methods/{id} | Remove a saved method |
| [**getBillingInvoice**](BillingApi.md#getbillinginvoice) | **GET** /v1/billing/invoices/{id} | Get subscription invoice |
| [**getCreditBalance**](BillingApi.md#getcreditbalance) | **GET** /v1/billing/credit | Get the credit balance |
| [**getSubscription**](BillingApi.md#getsubscription) | **GET** /v1/billing/subscription | Get seats and billing status |
| [**listBillingInvoices**](BillingApi.md#listbillinginvoices) | **GET** /v1/billing/invoices | List subscription invoices |
| [**listBillingPayments**](BillingApi.md#listbillingpayments) | **GET** /v1/billing/payments | List payment history |
| [**listCreditEntries**](BillingApi.md#listcreditentries) | **GET** /v1/billing/credit/ledger | List credit movements |
| [**listCreditRefunds**](BillingApi.md#listcreditrefunds) | **GET** /v1/billing/credit/refunds | List credit refunds |
| [**listPaymentMethods**](BillingApi.md#listpaymentmethods) | **GET** /v1/billing/payment-methods | List saved payment methods |
| [**receiveXenditWebhook**](BillingApi.md#receivexenditwebhook) | **POST** /v1/billing/webhooks/xendit | Receive Xendit payment events |
| [**startTrial**](BillingApi.md#starttrial) | **POST** /v1/billing/trial | Start the free trial |
| [**updateSubscription**](BillingApi.md#updatesubscription) | **PATCH** /v1/billing/subscription | Schedule fewer seats |



## addSeats

> BillingInvoiceDetailResponse addSeats(seatAdditionInput, idempotencyKey)

Add seats now

Buys more seats in the middle of a billing period. The charge is prorated for the days left in the current period, and the next renewal bills all seats in full. It creates an invoice, applies any credit first, and the new seats activate only when it is paid. Use it when an owner needs to invite more people than the seats bought allow.  The charge is &#x60;seats&#x60; × the seat price × days remaining ÷ days in the period, rounded half up once on the invoice line. Days remaining run from today up to, but not including, the next due date. The result is an invoice of kind &#x60;seat_addition&#x60;; pay it with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout). An unpaid invoice expires after 24 hours and no seats activate. Once it is paid, &#x60;purchased_seats&#x60; in [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription) goes up and [&#x60;POST /v1/users&#x60;](#tag/users/POST/v1/users) can invite more people. Send an &#x60;Idempotency-Key&#x60; header so a retry does not buy twice.  Error codes: &#x60;subscription_not_paid&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { AddSeatsRequest } from '@zerpto/sdk';

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
    // SeatAdditionInput
    seatAdditionInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies AddSeatsRequest;

  try {
    const data = await api.addSeats(body);
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
| **seatAdditionInput** | [SeatAdditionInput](SeatAdditionInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**BillingInvoiceDetailResponse**](BillingInvoiceDetailResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Invoice created |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## cancelSubscription

> SubscriptionResponse cancelSubscription(idempotencyKey)

Cancel at period end

Stops the subscription from renewing. The tenant keeps every feature and all its paid seats until &#x60;current_period_end&#x60;, then drops to the free plan with its data kept. No further renewal invoices are created, and nothing already paid is refunded. Use it when an owner decides to leave. Calling it again on a subscription that is already being cancelled returns 200 and changes nothing.  After this call [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription) shows &#x60;cancel_at_period_end&#x60; as true. The tenant can subscribe again at any time with [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription). Send an &#x60;Idempotency-Key&#x60; header so a retry is safe.  Error codes: &#x60;subscription_not_paid&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Starts a payment for an open subscription invoice and returns the address of a payment page hosted by Xendit. Redirect the person to it. They choose how to pay on that page, such as an e-wallet like GoPay or OVO, QRIS, a bank virtual account or a card, and for a method that can be saved (an e-wallet or a card) they can choose to save it for the next period. No card or account data passes through this API.  The invoice id comes from [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices). The amount to pay is the invoice\&#39;s &#x60;amount_due&#x60;, after any credit. Each call creates a new payment attempt with its own &#x60;payment_url&#x60;, which stops working at &#x60;expires_at&#x60;. The redirect back to your site is not proof of payment: the payment becomes &#x60;paid&#x60; when Xendit confirms it through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit). Follow it with [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments). A saved method is listed by [&#x60;GET /v1/billing/payment-methods&#x60;](#tag/billing/GET/v1/billing/payment-methods), and from then on renewals are charged to it without calling this. Send an &#x60;Idempotency-Key&#x60; header so a retry does not create two attempts.  Error codes: &#x60;invoice_not_payable&#x60; (already paid, expired or void).  **Response meta** - &#x60;meta&#x60; is empty. 

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


## createCreditRefund

> CreditRefundResponse createCreditRefund(idempotencyKey)

Refund the credit

Asks for the whole remaining credit balance to be sent back through Xendit, and empties the balance. Only the owner can do it. Use it when an owner stops using Zerpto and wants the unused credit back. Subscription payments, including unused seats in the current period, are never refunded.  The refund starts as &#x60;pending&#x60; and is updated when Xendit reports back through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit). Follow it with [&#x60;GET /v1/billing/credit/refunds&#x60;](#tag/billing/GET/v1/billing/credit/refunds). Send an &#x60;Idempotency-Key&#x60; header so a retry does not refund twice.  Error codes: &#x60;credit_empty&#x60;, &#x60;refund_pending&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { CreateCreditRefundRequest } from '@zerpto/sdk';

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
  } satisfies CreateCreditRefundRequest;

  try {
    const data = await api.createCreditRefund(body);
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

[**CreditRefundResponse**](CreditRefundResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Refund requested |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createCreditTopUp

> CheckoutResponse createCreditTopUp(creditTopUpInput, idempotencyKey)

Top up the credit

Starts a top-up of the credit balance and returns the address of a payment page hosted by Xendit. Redirect the person to it. The credit does not expire. Use it to pay renewals in advance, or to keep seats paid without handling an invoice each month.  The balance goes up when Xendit confirms the payment through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit), and the movement shows in [&#x60;GET /v1/billing/credit/ledger&#x60;](#tag/billing/GET/v1/billing/credit/ledger). The payment itself is listed by [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments). Credit already held is used first for the next invoice. Send an &#x60;Idempotency-Key&#x60; header so a retry does not create two payment pages.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { CreateCreditTopUpRequest } from '@zerpto/sdk';

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
    // CreditTopUpInput
    creditTopUpInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCreditTopUpRequest;

  try {
    const data = await api.createCreditTopUp(body);
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
| **creditTopUpInput** | [CreditTopUpInput](CreditTopUpInput.md) |  | |
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
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createSubscription

> BillingInvoiceDetailResponse createSubscription(subscribeInput, idempotencyKey)

Subscribe with seats

Subscribes the current tenant by buying a number of seats at the seat price. It creates the first invoice, which is due now and paid first: the seats and every feature activate only when it is paid, and the billing day becomes the day the payment is confirmed. Use it when an owner wants to unlock all features straight away, or when the trial is ending.  &#x60;seats&#x60; must be at least the seats already in use, which are the owner, every active user and every pending invite, so a tenant coming out of a trial cannot buy fewer seats than it used unless it first removes users with [&#x60;DELETE /v1/users/{{id}}&#x60;](#tag/users/DELETE/v1/users/{{id}}) or [&#x60;DELETE /v1/users/{{id}}/activate&#x60;](#tag/users/DELETE/v1/users/{{id}}/activate). Any credit balance is applied first ([&#x60;GET /v1/billing/credit&#x60;](#tag/billing/GET/v1/billing/credit)); the rest is paid with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout), and the confirmation arrives through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit), which makes the &#x60;status&#x60; &#x60;paid&#x60;. An unpaid invoice expires after 24 hours and nothing activates. The price comes from [&#x60;GET /v1/pricing&#x60;](#tag/pricing/GET/v1/pricing). Send an &#x60;Idempotency-Key&#x60; header so a retry does not create two invoices.  Error codes: &#x60;subscription_exists&#x60;, &#x60;seats_below_occupied&#x60;, &#x60;invoice_pending&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

[**BillingInvoiceDetailResponse**](BillingInvoiceDetailResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Invoice created |  -  |
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

Returns one subscription invoice in full: its lines, subtotal, PPN, total, billing period, due date, the time it was paid and a link to the PDF. Use it to show an invoice to the person, or to let them download it.  The id comes from [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices). A renewal invoice is created 7 days before its due date with any credit already applied, and one that credit covers entirely is paid on the due date without a payment. If the status is &#x60;open&#x60;, pay it with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout); the attempts made so far are in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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


## getCreditBalance

> CreditBalanceResponse getCreditBalance()

Get the credit balance

Returns the prepaid credit the tenant holds. The credit is applied first to every invoice, before anything is charged on Xendit, and an invoice it covers entirely is paid by itself. Use it on the billing page to show how much credit is left.  The balance is the sum of the movements listed by [&#x60;GET /v1/billing/credit/ledger&#x60;](#tag/billing/GET/v1/billing/credit/ledger). Add credit with [&#x60;POST /v1/billing/credit/top-ups&#x60;](#tag/billing/POST/v1/billing/credit/top-ups) and take what is left back with [&#x60;POST /v1/billing/credit/refunds&#x60;](#tag/billing/POST/v1/billing/credit/refunds).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { GetCreditBalanceRequest } from '@zerpto/sdk';

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
    const data = await api.getCreditBalance();
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

[**CreditBalanceResponse**](CreditBalanceResponse.md)

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


## getSubscription

> SubscriptionResponse getSubscription()

Get seats and billing status

Returns the billing state of the current tenant: its &#x60;status&#x60; (&#x60;free&#x60;, &#x60;trial&#x60;, &#x60;paid&#x60; or &#x60;overdue&#x60;), the seats it has bought and the seats in use, any seat reduction scheduled for the next renewal, the billing day and period, and when the trial ends. Use it to build the billing page, to show how many seats are still free before inviting someone, or to decide what the tenant may still do.  &#x60;free&#x60; has the basic features and one seat. &#x60;trial&#x60; has every feature for up to 3 seats. &#x60;paid&#x60; has every feature for the seats bought. &#x60;overdue&#x60; has dropped back to the basic features, with every user except the owner read-only, until the open invoice is paid. Which feature is basic or paid comes from [&#x60;GET /v1/features&#x60;](#tag/pricing/GET/v1/features). Seats are bought with [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription) and [&#x60;POST /v1/billing/seat-additions&#x60;](#tag/billing/POST/v1/billing/seat-additions), reduced with [&#x60;PATCH /v1/billing/subscription&#x60;](#tag/billing/PATCH/v1/billing/subscription), and the invoices behind them are listed by [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices). All dates follow Asia/Jakarta.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Lists the subscription invoices of the current tenant. Each one is the full invoice: its number, kind (&#x60;subscription&#x60;, &#x60;renewal&#x60; or &#x60;seat_addition&#x60;), status (&#x60;open&#x60;, &#x60;paid&#x60;, &#x60;expired&#x60; or &#x60;void&#x60;), billing period, due date, lines, PPN, total, the credit applied and the amount still due, and a link to the PDF. Use it for the billing history page, or to find the invoice that has to be paid: filter with &#x60;status&#x3D;open&#x60;.  A single invoice is returned by [&#x60;GET /v1/billing/invoices/{id}&#x60;](#tag/billing/GET/v1/billing/invoices/{id}) in the same shape as the items of this list. Pay an open one with [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout), and see what was paid in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

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
    // 'open' | 'paid' | 'expired' | 'void' | Only invoices with this status. Omit it to get every status. (optional)
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
| **status** | `open`, `paid`, `expired`, `void` | Only invoices with this status. Omit it to get every status. | [Optional] [Defaults to `undefined`] [Enum: open, paid, expired, void] |
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

Lists the payment attempts for subscription invoices and credit top-ups, with their amount, how they were paid (&#x60;method&#x60; and &#x60;channel&#x60;), whether the person paid on the payment page or Zerpto charged a saved method (&#x60;source&#x60;), status (&#x60;pending&#x60;, &#x60;paid&#x60;, &#x60;expired&#x60; or &#x60;failed&#x60;) and time. One invoice can have several attempts, for example an expired payment page followed by a new one. Filter with &#x60;invoice_id&#x60; to see the attempts for one invoice; a top-up has no invoice.  Every attempt is created by [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout), and its status is updated when Xendit reports back through [&#x60;POST /v1/billing/webhooks/xendit&#x60;](#tag/billing/POST/v1/billing/webhooks/xendit). The invoice itself is shown by [&#x60;GET /v1/billing/invoices/{id}&#x60;](#tag/billing/GET/v1/billing/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

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


## listCreditEntries

> CreditEntryListResponse listCreditEntries(perPage, page)

List credit movements

Lists every movement of the credit balance, newest first: top-ups, amounts applied to invoices, refunds and manual adjustments. The ledger is append-only, so an entry is never changed or removed, and the balance is always their sum. Use it for the credit history on the billing page.  Each entry links to the invoice or payment behind it. The current total is returned by [&#x60;GET /v1/billing/credit&#x60;](#tag/billing/GET/v1/billing/credit), and the invoices by [&#x60;GET /v1/billing/invoices&#x60;](#tag/billing/GET/v1/billing/invoices).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { ListCreditEntriesRequest } from '@zerpto/sdk';

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
  } satisfies ListCreditEntriesRequest;

  try {
    const data = await api.listCreditEntries(body);
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

[**CreditEntryListResponse**](CreditEntryListResponse.md)

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


## listCreditRefunds

> CreditRefundListResponse listCreditRefunds(perPage, page)

List credit refunds

Lists the refunds of credit balance that the owner requested, newest first, with their status. Use it to follow a refund from &#x60;pending&#x60; to &#x60;completed&#x60; or &#x60;failed&#x60;.  A refund is requested with [&#x60;POST /v1/billing/credit/refunds&#x60;](#tag/billing/POST/v1/billing/credit/refunds), and its movement shows in [&#x60;GET /v1/billing/credit/ledger&#x60;](#tag/billing/GET/v1/billing/credit/ledger) once it is sent.  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { ListCreditRefundsRequest } from '@zerpto/sdk';

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
  } satisfies ListCreditRefundsRequest;

  try {
    const data = await api.listCreditRefunds(body);
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

[**CreditRefundListResponse**](CreditRefundListResponse.md)

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

Receives payment events from Xendit. Xendit calls it when a payment page is completed or expires, when a credit refund is sent or fails, and when a saved payment method becomes active, fails or expires. Zerpto then updates the payment, the invoice, the credit balance and the saved method. When an invoice is paid it activates the new seats, sets the billing day on the first payment, and brings an &#x60;overdue&#x60; tenant back to &#x60;paid&#x60; with everything restored. It is meant for Xendit only, not for your own code, and it is the only way a payment becomes &#x60;paid&#x60;. If Zerpto adds another payment provider, that provider gets its own endpoint next to this one.  Xendit reports on every payment page created by [&#x60;POST /v1/billing/checkout&#x60;](#tag/billing/POST/v1/billing/checkout) or [&#x60;POST /v1/billing/credit/top-ups&#x60;](#tag/billing/POST/v1/billing/credit/top-ups), and on every refund from [&#x60;POST /v1/billing/credit/refunds&#x60;](#tag/billing/POST/v1/billing/credit/refunds), and the outcome shows up in [&#x60;GET /v1/billing/payments&#x60;](#tag/billing/GET/v1/billing/payments), [&#x60;GET /v1/billing/invoices/{id}&#x60;](#tag/billing/GET/v1/billing/invoices/{id}) and [&#x60;GET /v1/billing/payment-methods&#x60;](#tag/billing/GET/v1/billing/payment-methods). The call is not tenant-authenticated: the &#x60;X-CALLBACK-TOKEN&#x60; header carries the callback token set up in Xendit, and a wrong token is rejected with 401. Handling is idempotent on the Xendit ids, so duplicate, late and out-of-order calls are safe, and any verified call gets 200 even when nothing changes, so that Xendit stops retrying.  Error codes: none specific.  **Response meta** - No response body, so no meta. 

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


## startTrial

> SubscriptionResponse startTrial(idempotencyKey)

Start the free trial

Starts the 30-day free trial for the current tenant. During the trial every feature is unlocked for up to 3 seats, counting the owner and pending invites, and no card is taken. Only the owner can start it. Use it when an owner wants to try all the features without paying. The trial belongs to the person: each user gets one, whichever tenant they start it in, and the phone number they verified can be used for one trial only.  The owner first verifies a phone number with [&#x60;POST /v1/auth/phone/code&#x60;](#tag/authentication/POST/v1/auth/phone/code) and [&#x60;POST /v1/auth/phone/verify&#x60;](#tag/authentication/POST/v1/auth/phone/verify); &#x60;trial_available&#x60; and &#x60;phone_verified&#x60; in [&#x60;GET /v1/auth/me&#x60;](#tag/authentication/GET/v1/auth/me) say whether the button can be offered. The result is read with [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription), where &#x60;status&#x60; is &#x60;trial&#x60; and &#x60;trial_ends_at&#x60; shows the end. Reminders go out 7, 3 and 1 days before it ends. When it ends without a subscription the tenant returns to &#x60;free&#x60;: invited users stay read-only, the owner can still edit all data, and the audit log keeps showing who did what. To keep every feature, subscribe at any time with [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription). Send an &#x60;Idempotency-Key&#x60; header so a retry does not start it twice.  Error codes: &#x60;phone_not_verified&#x60;, &#x60;phone_already_used&#x60;, &#x60;trial_used&#x60;, &#x60;subscription_exists&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BillingApi,
} from '@zerpto/sdk';
import type { StartTrialRequest } from '@zerpto/sdk';

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
  } satisfies StartTrialRequest;

  try {
    const data = await api.startTrial(body);
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
| **201** | Trial started |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateSubscription

> SubscriptionResponse updateSubscription(subscriptionUpdate)

Schedule fewer seats

Sets how many seats to bill at the next renewal, so a team that shrinks can reduce its seats without losing anything now. The seats already paid for stay usable until the period ends, and the renewal bills the larger of &#x60;scheduled_seats&#x60; and the seats in use at that time. Send &#x60;null&#x60; to clear a schedule. Use it when fewer people need access from the next period.  The current schedule is shown by [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription) as &#x60;scheduled_seats&#x60;. To add seats instead, call [&#x60;POST /v1/billing/seat-additions&#x60;](#tag/billing/POST/v1/billing/seat-additions); to stop renewing altogether, call [&#x60;DELETE /v1/billing/subscription&#x60;](#tag/billing/DELETE/v1/billing/subscription). Seats are never refunded, and a user removed with [&#x60;DELETE /v1/users/{{id}}/activate&#x60;](#tag/users/DELETE/v1/users/{{id}}/activate) frees a seat that another person can take at no cost.  Error codes: &#x60;subscription_not_paid&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

