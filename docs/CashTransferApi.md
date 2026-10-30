# CashTransferApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createCashTransfer**](CashTransferApi.md#createcashtransfer) | **POST** /v1/cash/transfers | Post a cash transfer |
| [**getCashTransfer**](CashTransferApi.md#getcashtransfer) | **GET** /v1/cash/transfers/{id} | Get cash transfer |
| [**listCashTransfers**](CashTransferApi.md#listcashtransfers) | **GET** /v1/cash/transfers | List cash transfers |
| [**uploadCashTransferAttachment**](CashTransferApi.md#uploadcashtransferattachment) | **POST** /v1/cash/transfers/{id}/attachment | Upload transfer proof |
| [**voidCashTransfer**](CashTransferApi.md#voidcashtransfer) | **POST** /v1/cash/transfers/{id}/void | Void a cash transfer |



## createCashTransfer

> CashTransferResponse createCashTransfer(cashTransferInput, idempotencyKey)

Post a cash transfer

Moves money from one cash account to another, such as a bank withdrawal into a wallet, or settling a wallet\&#39;s takings into a bank account. Send the &#x60;from_cash_account_id&#x60;, the &#x60;to_cash_account_id&#x60;, the &#x60;amount&#x60;, the &#x60;currency&#x60;, the &#x60;transfer_date&#x60; and an optional &#x60;reference&#x60; or &#x60;notes&#x60;. It posts straight away: a journal entry debits the destination\&#39;s linked ledger account and credits the source\&#39;s. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  When the transfer carries a cost, such as a bank transfer fee or an e-wallet top-up cut, send &#x60;fee_amount&#x60; with &#x60;fee_account_id&#x60; and &#x60;fee_borne_by&#x60;. The journal entry then gets a third line booking &#x60;fee_amount&#x60; to &#x60;fee_account_id&#x60;, and the fee is taken out of whichever side &#x60;fee_borne_by&#x60; names: &#x60;source&#x60; debits &#x60;from_cash_account_id&#x60; for &#x60;amount&#x60; plus the fee so &#x60;to_cash_account_id&#x60; still receives the full &#x60;amount&#x60;; &#x60;destination&#x60; debits &#x60;from_cash_account_id&#x60; for exactly &#x60;amount&#x60; and credits &#x60;to_cash_account_id&#x60; for &#x60;amount&#x60; minus the fee. Leave all three out for a transfer with no cost.  Take both account ids from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts); they must be different accounts in the same currency. The result is a &#x60;CashTransfer&#x60; whose &#x60;journal_entry_id&#x60; can be read with [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}). Attach proof of the transfer with [&#x60;POST /v1/cash/transfers/{id}/attachment&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/attachment). A transfer posted by mistake is corrected with [&#x60;POST /v1/cash/transfers/{id}/void&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/void).  Error codes: &#x60;unknown_cash_account&#x60;, &#x60;same_cash_account&#x60;, &#x60;currency_mismatch&#x60;, &#x60;period_closed&#x60;, &#x60;fee_details_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns one cash transfer by its &#x60;id&#x60;, with the source and destination account, the amount, the date, the status, the &#x60;journal_entry_id&#x60; it posted and its &#x60;attachment&#x60;, if any. Use it to show the transfer, or to check whether it has been voided.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers) or from the response of [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers). Void it with [&#x60;POST /v1/cash/transfers/{id}/void&#x60;](#tag/cash-transfer/POST/v1/cash/transfers/{id}/void).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Lists the transfers you have posted between cash accounts, each with the source and destination account, the amount, the date and the status. Use it to show a cash account\&#39;s transfer history, or to find one to void. Filter by &#x60;cash_account_id&#x60; to see every transfer that touched one account, either as source or destination.  Get a &#x60;cash_account_id&#x60; for the filter from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts). A new transfer is posted with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers) and read with [&#x60;GET /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/GET/v1/cash/transfers/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

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


## uploadCashTransferAttachment

> CashTransferResponse uploadCashTransferAttachment(id, file, idempotencyKey)

Upload transfer proof

Attaches the proof of this transfer, such as a bank transfer receipt or an e-wallet screenshot. Send exactly one file; a repeated call replaces the transfer\&#39;s attachment with the new file rather than adding another. Can be called whether the transfer is posted or void.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers) or from the response of [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers). The uploaded file is read back with [&#x60;GET /v1/cash/transfers/{id}&#x60;](#tag/cash-transfer/GET/v1/cash/transfers/{id}) as &#x60;attachment&#x60;.  Error codes: &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Voids a posted cash transfer, reversing its journal entry. Transfers are immutable once posted, so a wrong transfer is corrected this way, then posted again correctly as a new transfer. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;id&#x60; from [&#x60;GET /v1/cash/transfers&#x60;](#tag/cash-transfer/GET/v1/cash/transfers). Post the corrected transfer with [&#x60;POST /v1/cash/transfers&#x60;](#tag/cash-transfer/POST/v1/cash/transfers).  Error codes: &#x60;transfer_already_void&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

