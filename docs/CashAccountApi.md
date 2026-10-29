# CashAccountApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createCashAccount**](CashAccountApi.md#createcashaccount) | **POST** /v1/cash/accounts | Create cash account |
| [**getCashAccount**](CashAccountApi.md#getcashaccount) | **GET** /v1/cash/accounts/{id} | Get cash account |
| [**listCashAccounts**](CashAccountApi.md#listcashaccounts) | **GET** /v1/cash/accounts | List cash accounts |
| [**updateCashAccount**](CashAccountApi.md#updatecashaccount) | **PATCH** /v1/cash/accounts/{id} | Update cash account |



## createCashAccount

> CashAccountResponse createCashAccount(cashAccountInput, idempotencyKey)

Create cash account

Registers a cash account, such as a bank account, an e-wallet (OVO, GoPay) or a physical cash wallet, and links it to its own ledger account so it has a balance. Send the &#x60;kind&#x60;, the &#x60;name&#x60; and the &#x60;gl_account_id&#x60;; &#x60;bank_name&#x60; and &#x60;account_number&#x60; are required for &#x60;kind: bank&#x60; and otherwise omitted. The &#x60;currency&#x60; is optional and defaults to the currency of the ledger account. A ledger account can be linked to one cash account only. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;gl_account_id&#x60; from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), choosing an asset account dedicated to this cash account. Change the name or number later with [&#x60;PATCH /v1/cash/accounts/{id}&#x60;](#tag/cash-account/PATCH/v1/cash/accounts/{id}). Once it exists, it can be used as the &#x60;cash_account_id&#x60; of payments and expenses, moved with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers), and, for &#x60;kind: bank&#x60;, have its statements uploaded with [&#x60;POST /v1/cash/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/cash/accounts/{id}/statements).  Error codes: &#x60;gl_account_already_linked&#x60;, &#x60;unknown_account&#x60;, &#x60;account_not_asset&#x60;, &#x60;bank_fields_required&#x60;, &#x60;currency_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashAccountApi,
} from '@zerpto/sdk';
import type { CreateCashAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashAccountApi(config);

  const body = {
    // CashAccountInput
    cashAccountInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCashAccountRequest;

  try {
    const data = await api.createCashAccount(body);
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
| **cashAccountInput** | [CashAccountInput](CashAccountInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CashAccountResponse**](CashAccountResponse.md)

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


## getCashAccount

> CashAccountResponse getCashAccount(id)

Get cash account

Returns one cash account by its &#x60;id&#x60;, with its &#x60;kind&#x60;, name, bank details if any, currency, linked ledger account, current &#x60;balance&#x60; and status. Use it to show the account with its balance, to prefill an edit form, or to check which ledger account it keeps its balance in.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts) or from the response of [&#x60;POST /v1/cash/accounts&#x60;](#tag/cash-account/POST/v1/cash/accounts). Change it with [&#x60;PATCH /v1/cash/accounts/{id}&#x60;](#tag/cash-account/PATCH/v1/cash/accounts/{id}). For a &#x60;kind: bank&#x60; account, statements are uploaded with [&#x60;POST /v1/cash/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/cash/accounts/{id}/statements), and the state of its matching is shown by [&#x60;GET /v1/reports/bank-reconciliation&#x60;](#tag/bank-reconciliation/GET/v1/reports/bank-reconciliation). For a balance as of a past date rather than now, use [&#x60;GET /v1/reports/cash-balances&#x60;](#tag/reports/GET/v1/reports/cash-balances).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashAccountApi,
} from '@zerpto/sdk';
import type { GetCashAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashAccountApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetCashAccountRequest;

  try {
    const data = await api.getCashAccount(body);
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

[**CashAccountResponse**](CashAccountResponse.md)

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


## listCashAccounts

> CashAccountListResponse listCashAccounts(perPage, page, status)

List cash accounts

Lists the cash accounts you have registered: bank accounts, e-wallets and physical cash, each with its &#x60;kind&#x60;, currency, the linked ledger account, its current &#x60;balance&#x60; and the status. Use it to fill a funding-source picker on payments, expenses and transfers, to show the cash accounts page with a balance next to each one, or to find the account a bank statement belongs to. Filter with &#x60;status&#x60; to see only the active ones, or only the archived ones.  New cash accounts are registered with [&#x60;POST /v1/cash/accounts&#x60;](#tag/cash-account/POST/v1/cash/accounts) and one is read with [&#x60;GET /v1/cash/accounts/{id}&#x60;](#tag/cash-account/GET/v1/cash/accounts/{id}). A &#x60;bank&#x60;-kind account\&#39;s &#x60;id&#x60; is the one you use to upload a statement with [&#x60;POST /v1/cash/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/cash/accounts/{id}/statements) and to start a reconciliation with [&#x60;POST /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations). Any kind can be moved between with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CashAccountApi,
} from '@zerpto/sdk';
import type { ListCashAccountsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashAccountApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // 'active' | 'archived' | Filter by status. (optional)
    status: status_example,
  } satisfies ListCashAccountsRequest;

  try {
    const data = await api.listCashAccounts(body);
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

[**CashAccountListResponse**](CashAccountListResponse.md)

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


## updateCashAccount

> CashAccountResponse updateCashAccount(id, cashAccountUpdate)

Update cash account

Changes a cash account. Send only the fields you want to change: the &#x60;name&#x60;, the &#x60;bank_name&#x60;, the &#x60;account_number&#x60; or the &#x60;status&#x60;. Set the status to &#x60;archived&#x60; when you stop using the account; it stays on record with its statements and reconciliations, if any. The &#x60;kind&#x60;, the linked ledger account and the currency cannot be changed, so register a new cash account if they must.  Read the current account with [&#x60;GET /v1/cash/accounts/{id}&#x60;](#tag/cash-account/GET/v1/cash/accounts/{id}) first. An archived account no longer accepts statements through [&#x60;POST /v1/cash/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/cash/accounts/{id}/statements), and it cannot be archived while a reconciliation is still open. Set it back to &#x60;active&#x60; here to use it again.  Error codes: &#x60;bank_account_has_open_reconciliation&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashAccountApi,
} from '@zerpto/sdk';
import type { UpdateCashAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashAccountApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // CashAccountUpdate
    cashAccountUpdate: ...,
  } satisfies UpdateCashAccountRequest;

  try {
    const data = await api.updateCashAccount(body);
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
| **cashAccountUpdate** | [CashAccountUpdate](CashAccountUpdate.md) |  | |

### Return type

[**CashAccountResponse**](CashAccountResponse.md)

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

