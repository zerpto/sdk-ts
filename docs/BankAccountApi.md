# BankAccountApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createBankAccount**](BankAccountApi.md#createbankaccount) | **POST** /v1/bank/accounts | Create bank account |
| [**getBankAccount**](BankAccountApi.md#getbankaccount) | **GET** /v1/bank/accounts/{id} | Get bank account |
| [**listBankAccounts**](BankAccountApi.md#listbankaccounts) | **GET** /v1/bank/accounts | List bank accounts |
| [**updateBankAccount**](BankAccountApi.md#updatebankaccount) | **PATCH** /v1/bank/accounts/{id} | Update bank account |



## createBankAccount

> BankAccountResponse createBankAccount(bankAccountInput, idempotencyKey)

Create bank account

Registers a bank account and links it to a cash or bank account in the ledger, so statements from the bank can be matched against your books. Send the &#x60;name&#x60;, the &#x60;bank_name&#x60;, the &#x60;account_number&#x60; and the &#x60;gl_account_id&#x60;; the &#x60;currency&#x60; is optional and defaults to the currency of the ledger account. A ledger account can be linked to one bank account only. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;gl_account_id&#x60; from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), choosing a cash or bank account. Change the name or number later with [&#x60;PATCH /v1/bank/accounts/{id}&#x60;](#tag/bank-account/PATCH/v1/bank/accounts/{id}). Once it exists, upload its statements with [&#x60;POST /v1/bank/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/bank/accounts/{id}/statements), then reconcile a period with [&#x60;POST /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations).  Error codes: &#x60;gl_account_already_linked&#x60;, &#x60;unknown_account&#x60;, &#x60;account_not_bank&#x60;, &#x60;currency_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BankAccountApi,
} from '@zerpto/sdk';
import type { CreateBankAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankAccountApi(config);

  const body = {
    // BankAccountInput
    bankAccountInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateBankAccountRequest;

  try {
    const data = await api.createBankAccount(body);
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
| **bankAccountInput** | [BankAccountInput](BankAccountInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**BankAccountResponse**](BankAccountResponse.md)

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


## getBankAccount

> BankAccountResponse getBankAccount(id)

Get bank account

Returns one bank account by its &#x60;id&#x60;, with its name, bank, account number, currency, linked ledger account and status. Use it to show the bank account, to prefill an edit form, or to check which ledger account its statements are reconciled against.  Take the &#x60;id&#x60; from [&#x60;GET /v1/bank/accounts&#x60;](#tag/bank-account/GET/v1/bank/accounts) or from the response of [&#x60;POST /v1/bank/accounts&#x60;](#tag/bank-account/POST/v1/bank/accounts). Change it with [&#x60;PATCH /v1/bank/accounts/{id}&#x60;](#tag/bank-account/PATCH/v1/bank/accounts/{id}). Statements are uploaded to it with [&#x60;POST /v1/bank/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/bank/accounts/{id}/statements), and the state of its matching is shown by [&#x60;GET /v1/reports/bank-reconciliation&#x60;](#tag/bank-reconciliation/GET/v1/reports/bank-reconciliation).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BankAccountApi,
} from '@zerpto/sdk';
import type { GetBankAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankAccountApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetBankAccountRequest;

  try {
    const data = await api.getBankAccount(body);
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

[**BankAccountResponse**](BankAccountResponse.md)

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


## listBankAccounts

> BankAccountListResponse listBankAccounts(perPage, page, status)

List bank accounts

Lists the bank accounts you have registered for reconciliation, with the bank, the account number, the currency, the linked ledger account and the status. Use it to fill a bank account picker, to show the bank accounts page, or to find the account a statement belongs to. Filter with &#x60;status&#x60; to see only the active ones, or only the archived ones.  New bank accounts are registered with [&#x60;POST /v1/bank/accounts&#x60;](#tag/bank-account/POST/v1/bank/accounts) and one is read with [&#x60;GET /v1/bank/accounts/{id}&#x60;](#tag/bank-account/GET/v1/bank/accounts/{id}). The &#x60;id&#x60; of a bank account is the one you use to upload a statement with [&#x60;POST /v1/bank/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/bank/accounts/{id}/statements) and to start a reconciliation with [&#x60;POST /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BankAccountApi,
} from '@zerpto/sdk';
import type { ListBankAccountsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankAccountApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // 'active' | 'archived' | Filter by status. (optional)
    status: status_example,
  } satisfies ListBankAccountsRequest;

  try {
    const data = await api.listBankAccounts(body);
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

[**BankAccountListResponse**](BankAccountListResponse.md)

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


## updateBankAccount

> BankAccountResponse updateBankAccount(id, bankAccountUpdate)

Update bank account

Changes a bank account. Send only the fields you want to change: the &#x60;name&#x60;, the &#x60;bank_name&#x60;, the &#x60;account_number&#x60; or the &#x60;status&#x60;. Set the status to &#x60;archived&#x60; when you stop using the account; it stays on record with its statements and reconciliations. The linked ledger account and the currency cannot be changed, so register a new bank account if they must.  Read the current account with [&#x60;GET /v1/bank/accounts/{id}&#x60;](#tag/bank-account/GET/v1/bank/accounts/{id}) first. An archived account no longer accepts statements through [&#x60;POST /v1/bank/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/bank/accounts/{id}/statements), and it cannot be archived while a reconciliation is still open. Set it back to &#x60;active&#x60; here to use it again.  Error codes: &#x60;bank_account_has_open_reconciliation&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BankAccountApi,
} from '@zerpto/sdk';
import type { UpdateBankAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankAccountApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // BankAccountUpdate
    bankAccountUpdate: ...,
  } satisfies UpdateBankAccountRequest;

  try {
    const data = await api.updateBankAccount(body);
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
| **bankAccountUpdate** | [BankAccountUpdate](BankAccountUpdate.md) |  | |

### Return type

[**BankAccountResponse**](BankAccountResponse.md)

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

