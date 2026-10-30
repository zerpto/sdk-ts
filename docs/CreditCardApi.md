# CreditCardApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createCreditCard**](CreditCardApi.md#createcreditcard) | **POST** /v1/credit-cards | Register credit card |
| [**getCreditCard**](CreditCardApi.md#getcreditcard) | **GET** /v1/credit-cards/{id} | Get credit card |
| [**listCreditCards**](CreditCardApi.md#listcreditcards) | **GET** /v1/credit-cards | List credit cards |
| [**updateCreditCard**](CreditCardApi.md#updatecreditcard) | **PATCH** /v1/credit-cards/{id} | Update credit card |



## createCreditCard

> CreditCardResponse createCreditCard(creditCardInput, idempotencyKey)

Register credit card

Registers a credit card and links it to its own liability ledger account so it has a balance. Send the &#x60;name&#x60;, &#x60;bank_name&#x60;, &#x60;card_number&#x60;, and the &#x60;gl_account_id&#x60;; &#x60;credit_limit&#x60; and &#x60;currency&#x60; are optional, and &#x60;currency&#x60; defaults to the currency of the ledger account. A ledger account can be linked to one credit card only. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;gl_account_id&#x60; from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), choosing a liability account dedicated to this card. Change the name, card number or status later with [&#x60;PATCH /v1/credit-cards/{id}&#x60;](#tag/credit-card/PATCH/v1/credit-cards/{id}). Once it exists, it can be used as &#x60;paid_via.credit_card_id&#x60; on expenses and vendor payments, and paid down with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments).  Error codes: &#x60;gl_account_already_linked&#x60;, &#x60;unknown_account&#x60;, &#x60;account_not_liability&#x60;, &#x60;currency_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardApi,
} from '@zerpto/sdk';
import type { CreateCreditCardRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardApi(config);

  const body = {
    // CreditCardInput
    creditCardInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCreditCardRequest;

  try {
    const data = await api.createCreditCard(body);
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
| **creditCardInput** | [CreditCardInput](CreditCardInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CreditCardResponse**](CreditCardResponse.md)

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


## getCreditCard

> CreditCardResponse getCreditCard(id)

Get credit card

Returns one credit card by its &#x60;id&#x60;, with its issuer, masked card number, currency, credit limit, linked liability account, current &#x60;balance&#x60; and status. Use it to show the card with its balance, to prefill an edit form, or to check which ledger account it keeps its balance in.  Take the &#x60;id&#x60; from [&#x60;GET /v1/credit-cards&#x60;](#tag/credit-card/GET/v1/credit-cards) or from the response of [&#x60;POST /v1/credit-cards&#x60;](#tag/credit-card/POST/v1/credit-cards). Change it with [&#x60;PATCH /v1/credit-cards/{id}&#x60;](#tag/credit-card/PATCH/v1/credit-cards/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardApi,
} from '@zerpto/sdk';
import type { GetCreditCardRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetCreditCardRequest;

  try {
    const data = await api.getCreditCard(body);
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

[**CreditCardResponse**](CreditCardResponse.md)

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


## listCreditCards

> CreditCardListResponse listCreditCards(perPage, page, status)

List credit cards

Lists the credit cards you have registered, each with its issuer, masked card number, currency, the linked liability account, its current &#x60;balance&#x60; (what you owe) and the status. Use it to fill a funding-source picker on expenses and payments, or to show the cards page with a balance next to each one. Filter with &#x60;status&#x60; to see only the active ones, or only the archived ones.  New credit cards are registered with [&#x60;POST /v1/credit-cards&#x60;](#tag/credit-card/POST/v1/credit-cards) and one is read with [&#x60;GET /v1/credit-cards/{id}&#x60;](#tag/credit-card/GET/v1/credit-cards/{id}). A card\&#39;s id is sent as &#x60;paid_via.credit_card_id&#x60; on [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses) and [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments), and paid down with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CreditCardApi,
} from '@zerpto/sdk';
import type { ListCreditCardsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // 'active' | 'archived' | Filter by status. (optional)
    status: status_example,
  } satisfies ListCreditCardsRequest;

  try {
    const data = await api.listCreditCards(body);
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
| **status** | `active`, `archived` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: active, archived] |

### Return type

[**CreditCardListResponse**](CreditCardListResponse.md)

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


## updateCreditCard

> CreditCardResponse updateCreditCard(id, creditCardUpdate)

Update credit card

Changes a credit card. Send only the fields you want to change: the &#x60;name&#x60;, the &#x60;bank_name&#x60;, the &#x60;card_number&#x60;, the &#x60;credit_limit&#x60; or the &#x60;status&#x60;. Set the status to &#x60;archived&#x60; when you stop using the card. The linked ledger account and the currency cannot be changed, so register a new credit card if they must.  Read the current card with [&#x60;GET /v1/credit-cards/{id}&#x60;](#tag/credit-card/GET/v1/credit-cards/{id}) first. Set it back to &#x60;active&#x60; here to use it again.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditCardApi,
} from '@zerpto/sdk';
import type { UpdateCreditCardRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditCardApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // CreditCardUpdate
    creditCardUpdate: ...,
  } satisfies UpdateCreditCardRequest;

  try {
    const data = await api.updateCreditCard(body);
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
| **creditCardUpdate** | [CreditCardUpdate](CreditCardUpdate.md) |  | |

### Return type

[**CreditCardResponse**](CreditCardResponse.md)

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

