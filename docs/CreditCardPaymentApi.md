# CreditCardPaymentApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelCreditCardPayment**](CreditCardPaymentApi.md#cancelcreditcardpayment) | **POST** /v1/credit-cards/payments/{id}/cancel | Cancel card payment |
| [**createCreditCardPayment**](CreditCardPaymentApi.md#createcreditcardpayment) | **POST** /v1/credit-cards/payments | Record a card payment |
| [**getCreditCardPayment**](CreditCardPaymentApi.md#getcreditcardpayment) | **GET** /v1/credit-cards/payments/{id} | Get credit card payment |
| [**listCreditCardPayments**](CreditCardPaymentApi.md#listcreditcardpayments) | **GET** /v1/credit-cards/payments | List credit card payments |
| [**postCreditCardPayment**](CreditCardPaymentApi.md#postcreditcardpayment) | **POST** /v1/credit-cards/payments/{id}/confirm | Post card payment to the GL |
| [**updateCreditCardPayment**](CreditCardPaymentApi.md#updatecreditcardpayment) | **PATCH** /v1/credit-cards/payments/{id} | Update credit card payment |
| [**voidCreditCardPayment**](CreditCardPaymentApi.md#voidcreditcardpayment) | **POST** /v1/credit-cards/payments/{id}/void | Void card payment |



## cancelCreditCardPayment

> CreditCardPaymentResponse cancelCreditCardPayment(id, idempotencyKey)

Cancel card payment

Cancels a draft credit card payment that you no longer want to record. The payment becomes &#x60;cancelled&#x60; and nothing posts to the GL. Only drafts can be cancelled; to reverse a posted payment, use the void call instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments) or [&#x60;PATCH /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/PATCH/v1/credit-cards/payments/{id}). Once you have called [&#x60;POST /v1/credit-cards/payments/{id}/confirm&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/confirm), reverse the payment with [&#x60;POST /v1/credit-cards/payments/{id}/void&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/void) instead. A cancelled payment stays in [&#x60;GET /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/GET/v1/credit-cards/payments) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;payment_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { CancelCreditCardPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelCreditCardPaymentRequest;

  try {
    const data = await api.cancelCreditCardPayment(body);
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

[**CreditCardPaymentResponse**](CreditCardPaymentResponse.md)

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


## createCreditCardPayment

> CreditCardPaymentResponse createCreditCardPayment(creditCardPaymentInput, idempotencyKey)

Record a card payment

Records a payment towards a credit card bill, as a draft. Send the &#x60;credit_card_id&#x60;, the &#x60;cash_account_id&#x60; the money leaves from, the &#x60;amount&#x60;, the &#x60;currency&#x60;, the &#x60;payment_date&#x60; and an optional &#x60;reference&#x60; or &#x60;notes&#x60;. Nothing posts to the GL until the draft is confirmed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;credit_card_id&#x60; from [&#x60;GET /v1/credit-cards&#x60;](#tag/credit-card/GET/v1/credit-cards) and the &#x60;cash_account_id&#x60; from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts); they must be the same currency. Fix the draft with [&#x60;PATCH /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/PATCH/v1/credit-cards/payments/{id}) or drop it with [&#x60;POST /v1/credit-cards/payments/{id}/cancel&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/cancel), and post it with [&#x60;POST /v1/credit-cards/payments/{id}/confirm&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/confirm).  Error codes: &#x60;unknown_credit_card&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;currency_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { CreateCreditCardPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // CreditCardPaymentInput
    creditCardPaymentInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCreditCardPaymentRequest;

  try {
    const data = await api.createCreditCardPayment(body);
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
| **creditCardPaymentInput** | [CreditCardPaymentInput](CreditCardPaymentInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CreditCardPaymentResponse**](CreditCardPaymentResponse.md)

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
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getCreditCardPayment

> CreditCardPaymentResponse getCreditCardPayment(id)

Get credit card payment

Returns one credit card payment by its &#x60;id&#x60;, with the card, the cash account, the amount, the date, the status and the &#x60;journal_entry_id&#x60; once posted. Use it to review a draft before posting, or to check whether it has been voided.  Take the &#x60;id&#x60; from [&#x60;GET /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/GET/v1/credit-cards/payments) or from the response of [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments). While it is a draft, change it with [&#x60;PATCH /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/PATCH/v1/credit-cards/payments/{id}) or drop it with [&#x60;POST /v1/credit-cards/payments/{id}/cancel&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/cancel); post it with [&#x60;POST /v1/credit-cards/payments/{id}/confirm&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/confirm), and reverse a posted one with [&#x60;POST /v1/credit-cards/payments/{id}/void&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/void).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { GetCreditCardPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetCreditCardPaymentRequest;

  try {
    const data = await api.getCreditCardPayment(body);
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

[**CreditCardPaymentResponse**](CreditCardPaymentResponse.md)

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


## listCreditCardPayments

> CreditCardPaymentListResponse listCreditCardPayments(perPage, page, creditCardId)

List credit card payments

Lists the payments made to pay down credit card bills, each with the card, the cash account the money left, the amount, the date and the status. Use it to show a card\&#39;s payment history, to find a draft to finish or drop, or to find a posted one to void. Filter by &#x60;credit_card_id&#x60; to see every payment made on one card.  Get a &#x60;credit_card_id&#x60; for the filter from [&#x60;GET /v1/credit-cards&#x60;](#tag/credit-card/GET/v1/credit-cards). A new payment is recorded with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments) and read with [&#x60;GET /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/GET/v1/credit-cards/payments/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { ListCreditCardPaymentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Filter by credit card. (optional)
    creditCardId: creditCardId_example,
  } satisfies ListCreditCardPaymentsRequest;

  try {
    const data = await api.listCreditCardPayments(body);
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
| **creditCardId** | `string` | Filter by credit card. | [Optional] [Defaults to `undefined`] |

### Return type

[**CreditCardPaymentListResponse**](CreditCardPaymentListResponse.md)

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


## postCreditCardPayment

> CreditCardPaymentResponse postCreditCardPayment(id, idempotencyKey)

Post card payment to the GL

Posts a draft credit card payment. It creates the journal entry, debiting the card\&#39;s liability account and crediting the cash account, for the amount. The status becomes &#x60;posted&#x60; and the payment is locked. The call fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the draft with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments) and [&#x60;PATCH /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/PATCH/v1/credit-cards/payments/{id}) first. After posting, the entry shows in [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}). If it was posted by mistake, reverse it with [&#x60;POST /v1/credit-cards/payments/{id}/void&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/void).  Error codes: &#x60;payment_not_draft&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { PostCreditCardPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostCreditCardPaymentRequest;

  try {
    const data = await api.postCreditCardPayment(body);
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

[**CreditCardPaymentResponse**](CreditCardPaymentResponse.md)

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


## updateCreditCardPayment

> CreditCardPaymentResponse updateCreditCardPayment(id, creditCardPaymentUpdate)

Update credit card payment

Changes a credit card payment that is still a draft. Send only the fields you want to change. Once it is posted, cancelled or void it can no longer be edited, and the call returns 409.  Read the current draft with [&#x60;GET /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/GET/v1/credit-cards/payments/{id}) first. When it is right, post it with [&#x60;POST /v1/credit-cards/payments/{id}/confirm&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/confirm). To drop it, call [&#x60;POST /v1/credit-cards/payments/{id}/cancel&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments/{id}/cancel).  Error codes: &#x60;payment_not_editable&#x60;, &#x60;unknown_credit_card&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;currency_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { UpdateCreditCardPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // CreditCardPaymentUpdate
    creditCardPaymentUpdate: ...,
  } satisfies UpdateCreditCardPaymentRequest;

  try {
    const data = await api.updateCreditCardPayment(body);
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
| **creditCardPaymentUpdate** | [CreditCardPaymentUpdate](CreditCardPaymentUpdate.md) |  | |

### Return type

[**CreditCardPaymentResponse**](CreditCardPaymentResponse.md)

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


## voidCreditCardPayment

> CreditCardPaymentResponse voidCreditCardPayment(id, idempotencyKey)

Void card payment

Voids a posted credit card payment by reversing its journal entry. The status becomes &#x60;void&#x60;. Use it when a payment was recorded by mistake, with the wrong amount or account, or twice. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Read the payment first with [&#x60;GET /v1/credit-cards/payments/{id}&#x60;](#tag/credit-card-payment/GET/v1/credit-cards/payments/{id}). After voiding, record the right payment with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments).  Error codes: &#x60;payment_not_voidable&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardPaymentApi,
} from '@zerpto/sdk';
import type { VoidCreditCardPaymentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardPaymentApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidCreditCardPaymentRequest;

  try {
    const data = await api.voidCreditCardPayment(body);
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

[**CreditCardPaymentResponse**](CreditCardPaymentResponse.md)

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

