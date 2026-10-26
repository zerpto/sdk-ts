# BankReconciliationApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**completeBankReconciliation**](BankReconciliationApi.md#completebankreconciliation) | **POST** /v1/bank/reconciliations/{id}/complete | Complete a reconciliation |
| [**createBankReconciliation**](BankReconciliationApi.md#createbankreconciliation) | **POST** /v1/bank/reconciliations | Start a reconciliation |
| [**listBankReconciliations**](BankReconciliationApi.md#listbankreconciliations) | **GET** /v1/bank/reconciliations | List reconciliations |



## completeBankReconciliation

> BankReconciliationResponse completeBankReconciliation(id, idempotencyKey)

Complete a reconciliation

Completes a reconciliation, which locks the result: its matches can no longer be changed and its status becomes &#x60;completed&#x60; with the time it was completed. It needs every statement line in the period to be matched and the difference to be zero. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Start the reconciliation with [&#x60;POST /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations) and settle the remaining lines with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match). If the call is refused, [&#x60;GET /v1/reports/bank-reconciliation&#x60;](#tag/bank-reconciliation/GET/v1/reports/bank-reconciliation) shows what is still unmatched. A completed reconciliation is listed with [&#x60;GET /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/GET/v1/bank/reconciliations), and the next period can then be started.  Error codes: &#x60;unmatched_lines&#x60;, &#x60;difference_not_zero&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BankReconciliationApi,
} from '@zerpto/sdk';
import type { CompleteBankReconciliationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankReconciliationApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CompleteBankReconciliationRequest;

  try {
    const data = await api.completeBankReconciliation(body);
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

[**BankReconciliationResponse**](BankReconciliationResponse.md)

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


## createBankReconciliation

> BankReconciliationResponse createBankReconciliation(bankReconciliationInput, idempotencyKey)

Start a reconciliation

Starts the reconciliation of one bank account for a period. Send the &#x60;cash_account_id&#x60;, the &#x60;period_start&#x60; and the &#x60;period_end&#x60;; the &#x60;statement_id&#x60; is optional and defaults to the statement that covers the period. The response shows the statement balance, the balance in your books and the difference, which should reach zero once every line is matched. A bank account can have only one reconciliation in progress. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;cash_account_id&#x60; from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts) and upload the statement first with [&#x60;POST /v1/cash/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/cash/accounts/{id}/statements). Work through its lines with [&#x60;GET /v1/bank/statements/{id}/lines&#x60;](#tag/statements/GET/v1/bank/statements/{id}/lines) and [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match), and watch the difference go down. When it is zero, finish with [&#x60;POST /v1/bank/reconciliations/{id}/complete&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations/{id}/complete).  Error codes: &#x60;reconciliation_in_progress&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;no_statement_for_period&#x60;, &#x60;period_overlap&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  BankReconciliationApi,
} from '@zerpto/sdk';
import type { CreateBankReconciliationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankReconciliationApi(config);

  const body = {
    // BankReconciliationInput
    bankReconciliationInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateBankReconciliationRequest;

  try {
    const data = await api.createBankReconciliation(body);
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
| **bankReconciliationInput** | [BankReconciliationInput](BankReconciliationInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**BankReconciliationResponse**](BankReconciliationResponse.md)

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


## listBankReconciliations

> BankReconciliationListResponse listBankReconciliations(perPage, page, cashAccountId, status)

List reconciliations

Lists the reconciliations you have started, with the bank account, the period, the statement and book balances, the difference and the status. Use it to find the one in progress, to review which periods are already closed out, or to show the reconciliation history of a bank account. Filter by &#x60;cash_account_id&#x60; or &#x60;status&#x60;.  Get a &#x60;cash_account_id&#x60; for the filter from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts). A new reconciliation is started with [&#x60;POST /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations) and finished with [&#x60;POST /v1/bank/reconciliations/{id}/complete&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations/{id}/complete). The lines still waiting for a match in a period are shown in [&#x60;GET /v1/reports/bank-reconciliation&#x60;](#tag/bank-reconciliation/GET/v1/reports/bank-reconciliation).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  BankReconciliationApi,
} from '@zerpto/sdk';
import type { ListBankReconciliationsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new BankReconciliationApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Filter by bank account. (optional)
    cashAccountId: cashAccountId_example,
    // 'in_progress' | 'completed' | Filter by status. (optional)
    status: status_example,
  } satisfies ListBankReconciliationsRequest;

  try {
    const data = await api.listBankReconciliations(body);
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
| **cashAccountId** | `string` | Filter by bank account. | [Optional] [Defaults to `undefined`] |
| **status** | `in_progress`, `completed` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: in_progress, completed] |

### Return type

[**BankReconciliationListResponse**](BankReconciliationListResponse.md)

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

