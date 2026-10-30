# CashTransferApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelCashTransfer**](CashTransferApi.md#cancelcashtransfer) | **POST** /v1/cash/transfers/{id}/cancel | Cancel cash transfer |
| [**createCashTransfer**](CashTransferApi.md#createcashtransfer) | **POST** /v1/cash/transfers | Record a cash transfer |
| [**getCashTransfer**](CashTransferApi.md#getcashtransfer) | **GET** /v1/cash/transfers/{id} | Get cash transfer |
| [**listCashTransfers**](CashTransferApi.md#listcashtransfers) | **GET** /v1/cash/transfers | List cash transfers |
| [**postCashTransfer**](CashTransferApi.md#postcashtransfer) | **POST** /v1/cash/transfers/{id}/confirm | Post cash transfer to the GL |
| [**updateCashTransfer**](CashTransferApi.md#updatecashtransfer) | **PATCH** /v1/cash/transfers/{id} | Update cash transfer |
| [**uploadCashTransferAttachment**](CashTransferApi.md#uploadcashtransferattachment) | **POST** /v1/cash/transfers/{id}/attachment | Upload transfer proof |
| [**voidCashTransfer**](CashTransferApi.md#voidcashtransfer) | **POST** /v1/cash/transfers/{id}/void | Void a cash transfer |



## cancelCashTransfer

> CashTransferResponse cancelCashTransfer(id, idempotencyKey)

Cancel cash transfer

Cancels a draft cash transfer that you no longer want to record. The transfer becomes &#x60;cancelled&#x60; and nothing posts to the GL. Only drafts can be cancelled; to reverse a posted transfer, use the void call instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers) or [&#x60;PATCH /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/PATCH/v1/cash/transfers/{id}). Once you have called [&#x60;POST /v1/cash/transfers/{id}/confirm&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/confirm), reverse the transfer with [&#x60;POST /v1/cash/transfers/{id}/void&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/void) instead. A cancelled transfer stays in [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;transfer_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { CancelCashTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelCashTransferRequest;

  try {
    const data = await api.cancelCashTransfer(body);
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

[**CashTransferResponse**](CashTransferResponse.md)

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


## createCashTransfer

> CashTransferResponse createCashTransfer(cashTransferInput, idempotencyKey)

Record a cash transfer

Records a transfer between cash accounts as a draft, such as a bank withdrawal into a wallet, or settling a wallet\&#39;s takings into a bank account. Send the &#x60;from_cash_account_id&#x60;, the &#x60;to_cash_account_id&#x60;, the &#x60;amount&#x60;, the &#x60;currency&#x60;, the &#x60;transfer_date&#x60; and an optional &#x60;reference&#x60; or &#x60;notes&#x60;. Nothing posts to the GL until the draft is confirmed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  When the transfer carries a cost, such as a bank transfer fee or an e-wallet top-up cut, send &#x60;fee_amount&#x60; with &#x60;fee_account_id&#x60; and &#x60;fee_borne_by&#x60;. Once posted, the journal entry gets a third line booking &#x60;fee_amount&#x60; to &#x60;fee_account_id&#x60;, and the fee is taken out of whichever side &#x60;fee_borne_by&#x60; names: &#x60;source&#x60; debits &#x60;from_cash_account_id&#x60; for &#x60;amount&#x60; plus the fee so &#x60;to_cash_account_id&#x60; still receives the full &#x60;amount&#x60;; &#x60;destination&#x60; debits &#x60;from_cash_account_id&#x60; for exactly &#x60;amount&#x60; and credits &#x60;to_cash_account_id&#x60; for &#x60;amount&#x60; minus the fee. Leave all three out for a transfer with no cost.  Take both account ids from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts); they must be different accounts in the same currency. Attach proof of the transfer with [&#x60;POST /v1/cash/transfers/{id}/attachment&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/attachment), fix the draft with [&#x60;PATCH /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/PATCH/v1/cash/transfers/{id}) or drop it with [&#x60;POST /v1/cash/transfers/{id}/cancel&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/cancel), and post it with [&#x60;POST /v1/cash/transfers/{id}/confirm&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/confirm).  Error codes: &#x60;unknown_cash_account&#x60;, &#x60;same_cash_account&#x60;, &#x60;currency_mismatch&#x60;, &#x60;fee_details_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { CreateCashTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // CashTransferInput
    cashTransferInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCashTransferRequest;

  try {
    const data = await api.createCashTransfer(body);
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
| **cashTransferInput** | [CashTransferInput](CashTransferInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CashTransferResponse**](CashTransferResponse.md)

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


## getCashTransfer

> CashTransferResponse getCashTransfer(id)

Get cash transfer

Returns one cash transfer by its &#x60;id&#x60;, with the source and destination account, the amount, the date, the status, the &#x60;journal_entry_id&#x60; once posted and its &#x60;attachment&#x60;, if any. Use it to review a draft before posting, to prefill an edit form, or to check whether it has been voided.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers) or from the response of [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers). While it is a draft, change it with [&#x60;PATCH /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/PATCH/v1/cash/transfers/{id}) or drop it with [&#x60;POST /v1/cash/transfers/{id}/cancel&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/cancel); post it with [&#x60;POST /v1/cash/transfers/{id}/confirm&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/confirm), and reverse a posted one with [&#x60;POST /v1/cash/transfers/{id}/void&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/void).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { GetCashTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetCashTransferRequest;

  try {
    const data = await api.getCashTransfer(body);
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

[**CashTransferResponse**](CashTransferResponse.md)

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


## listCashTransfers

> CashTransferListResponse listCashTransfers(perPage, page, cashAccountId)

List cash transfers

Lists the transfers between cash accounts, each with the source and destination account, the amount, the date and the status. Use it to show a cash account\&#39;s transfer history, to find a draft to finish or drop, or to find a posted one to void. Filter by &#x60;cash_account_id&#x60; to see every transfer that touched one account, either as source or destination.  Get a &#x60;cash_account_id&#x60; for the filter from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts). A new transfer is recorded with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers) and read with [&#x60;GET /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/GET/v1/cash/transfers/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { ListCashTransfersRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Filter by source or destination cash account. (optional)
    cashAccountId: cashAccountId_example,
  } satisfies ListCashTransfersRequest;

  try {
    const data = await api.listCashTransfers(body);
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
| **cashAccountId** | `string` | Filter by source or destination cash account. | [Optional] [Defaults to `undefined`] |

### Return type

[**CashTransferListResponse**](CashTransferListResponse.md)

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


## postCashTransfer

> CashTransferResponse postCashTransfer(id, idempotencyKey)

Post cash transfer to the GL

Posts a draft cash transfer. It creates the journal entry debiting the destination\&#39;s linked ledger account and crediting the source\&#39;s, plus a fee line when &#x60;fee_amount&#x60; is set. The status becomes &#x60;posted&#x60; and the transfer is locked. The call fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the draft with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers) and [&#x60;PATCH /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/PATCH/v1/cash/transfers/{id}) first. After posting, the entry shows in [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}). If it was posted by mistake, reverse it with [&#x60;POST /v1/cash/transfers/{id}/void&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/void).  Error codes: &#x60;transfer_not_draft&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { PostCashTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostCashTransferRequest;

  try {
    const data = await api.postCashTransfer(body);
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

[**CashTransferResponse**](CashTransferResponse.md)

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


## updateCashTransfer

> CashTransferResponse updateCashTransfer(id, cashTransferUpdate)

Update cash transfer

Changes a cash transfer that is still a draft. Send only the fields you want to change. The same rules as on creation apply. Once the transfer is posted, cancelled or void it can no longer be edited, and the call returns 409.  Read the current draft with [&#x60;GET /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/GET/v1/cash/transfers/{id}) first. When it is right, post it with [&#x60;POST /v1/cash/transfers/{id}/confirm&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/confirm). To drop it, call [&#x60;POST /v1/cash/transfers/{id}/cancel&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/cancel).  Error codes: &#x60;transfer_not_editable&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;same_cash_account&#x60;, &#x60;currency_mismatch&#x60;, &#x60;fee_details_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { UpdateCashTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // CashTransferUpdate
    cashTransferUpdate: ...,
  } satisfies UpdateCashTransferRequest;

  try {
    const data = await api.updateCashTransfer(body);
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
| **cashTransferUpdate** | [CashTransferUpdate](CashTransferUpdate.md) |  | |

### Return type

[**CashTransferResponse**](CashTransferResponse.md)

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


## uploadCashTransferAttachment

> CashTransferResponse uploadCashTransferAttachment(id, file, idempotencyKey)

Upload transfer proof

Attaches the proof of this transfer, such as a bank transfer receipt or an e-wallet screenshot. Send exactly one file; a repeated call replaces the transfer\&#39;s attachment with the new file rather than adding another. Can be called whether the transfer is a draft, posted or void.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers) or from the response of [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers). The uploaded file is read back with [&#x60;GET /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/GET/v1/cash/transfers/{id}) as &#x60;attachment&#x60;.  Error codes: &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { UploadCashTransferAttachmentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // Blob | PDF, JPEG or PNG, up to 10 MB.
    file: BINARY_DATA_HERE,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies UploadCashTransferAttachmentRequest;

  try {
    const data = await api.uploadCashTransferAttachment(body);
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
| **file** | `Blob` | PDF, JPEG or PNG, up to 10 MB. | [Defaults to `undefined`] |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CashTransferResponse**](CashTransferResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## voidCashTransfer

> CashTransferResponse voidCashTransfer(id, idempotencyKey)

Void a cash transfer

Voids a posted cash transfer, reversing its journal entry. Transfers are immutable once posted, so a wrong transfer is corrected this way, then recorded again correctly as a new transfer. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers). Record the corrected transfer with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers).  Error codes: &#x60;transfer_not_voidable&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CashTransferApi,
} from '@zerpto/sdk';
import type { VoidCashTransferRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CashTransferApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidCashTransferRequest;

  try {
    const data = await api.voidCashTransfer(body);
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

[**CashTransferResponse**](CashTransferResponse.md)

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

