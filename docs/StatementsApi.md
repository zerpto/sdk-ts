# StatementsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**listBankStatementLines**](StatementsApi.md#listbankstatementlines) | **GET** /v1/bank/statements/{id}/lines | List statement lines |
| [**matchBankStatementLine**](StatementsApi.md#matchbankstatementline) | **POST** /v1/bank/statement-lines/{id}/match | Match a line |
| [**unmatchBankStatementLine**](StatementsApi.md#unmatchbankstatementline) | **POST** /v1/bank/statement-lines/{id}/unmatch | Remove a match |
| [**uploadBankStatement**](StatementsApi.md#uploadbankstatement) | **POST** /v1/bank/accounts/{id}/statements | Upload a statement file |



## listBankStatementLines

> BankStatementLineListResponse listBankStatementLines(id, limit, cursor, matchStatus, dateFrom, dateTo)

List statement lines

Lists the lines of one statement, each with its date, description, reference, signed amount, match status and the payments or entries it is matched to. Use it to work through a statement, to find lines that still need a match, or to show the user what auto-match suggested. Filter by &#x60;match_status&#x60; or a date range. A &#x60;suggested&#x60; line means auto-match found a candidate that still needs your confirmation.  Take the statement &#x60;id&#x60; from the response of [&#x60;POST /v1/bank/accounts/{id}/statements&#x60;](#tag/statements/POST/v1/bank/accounts/{id}/statements). Confirm or set the match of a line with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match), and take one back with [&#x60;POST /v1/bank/statement-lines/{id}/unmatch&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/unmatch). The lines are paged with a cursor: pass the &#x60;next_cursor&#x60; of one response as &#x60;cursor&#x60; in the next call. What is left unmatched in a period shows in [&#x60;GET /v1/reports/bank-reconciliation&#x60;](#tag/bank-reconciliation/GET/v1/reports/bank-reconciliation).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;next_cursor&#x60;, &#x60;has_more&#x60;, &#x60;limit&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;next&#x60; (&#x60;next&#x60; is null on the last page). Use &#x60;?cursor&#x3D;&#x60; and &#x60;?limit&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  StatementsApi,
} from '@zerpto/sdk';
import type { ListBankStatementLinesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new StatementsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // number | Page size. (optional)
    limit: 56,
    // string | `next_cursor` from the previous page. (optional)
    cursor: cursor_example,
    // 'unmatched' | 'suggested' | 'matched' | Filter by match status. (optional)
    matchStatus: matchStatus_example,
    // Date | On or after this date. (optional)
    dateFrom: 2013-10-20,
    // Date | On or before this date. (optional)
    dateTo: 2013-10-20,
  } satisfies ListBankStatementLinesRequest;

  try {
    const data = await api.listBankStatementLines(body);
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
| **limit** | `number` | Page size. | [Optional] [Defaults to `50`] |
| **cursor** | `string` | &#x60;next_cursor&#x60; from the previous page. | [Optional] [Defaults to `undefined`] |
| **matchStatus** | `unmatched`, `suggested`, `matched` | Filter by match status. | [Optional] [Defaults to `undefined`] [Enum: unmatched, suggested, matched] |
| **dateFrom** | `Date` | On or after this date. | [Optional] [Defaults to `undefined`] |
| **dateTo** | `Date` | On or before this date. | [Optional] [Defaults to `undefined`] |

### Return type

[**BankStatementLineListResponse**](BankStatementLineListResponse.md)

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


## matchBankStatementLine

> BankStatementLineResponse matchBankStatementLine(id, bankMatchInput, idempotencyKey)

Match a line

Matches a statement line to what it pays for. Send the &#x60;targets&#x60;: one or more customer payments, vendor payments or journal entries, or an &#x60;adjustment&#x60; that posts a new entry to the ledger for a bank fee or interest. The matched amounts must add up to the amount of the line. Matching a suggested line confirms it. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the line &#x60;id&#x60; from [&#x60;GET /v1/bank/statements/{id}/lines&#x60;](#tag/statements/GET/v1/bank/statements/{id}/lines), the payment to match from [&#x60;POST /v1/ar/payments&#x60;](#tag/customer-payment/POST/v1/ar/payments) or [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments), and the &#x60;account_id&#x60; of an adjustment from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). If you matched the wrong thing, remove it with [&#x60;POST /v1/bank/statement-lines/{id}/unmatch&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/unmatch). When all lines are matched, complete the period with [&#x60;POST /v1/bank/reconciliations/{id}/complete&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations/{id}/complete).  Error codes: &#x60;match_amount_mismatch&#x60;, &#x60;unknown_target&#x60;, &#x60;target_already_matched&#x60;, &#x60;unknown_account&#x60;, &#x60;reconciliation_locked&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  StatementsApi,
} from '@zerpto/sdk';
import type { MatchBankStatementLineRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new StatementsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // BankMatchInput
    bankMatchInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies MatchBankStatementLineRequest;

  try {
    const data = await api.matchBankStatementLine(body);
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
| **bankMatchInput** | [BankMatchInput](BankMatchInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**BankStatementLineResponse**](BankStatementLineResponse.md)

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


## unmatchBankStatementLine

> BankStatementLineResponse unmatchBankStatementLine(id, idempotencyKey)

Remove a match

Removes the match of a statement line, so it becomes &#x60;unmatched&#x60; again. If the match was an adjustment, the journal entry it created is reversed. The payments or entries that were matched are not changed. This is not allowed once the reconciliation that covers the line is completed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the line &#x60;id&#x60; from [&#x60;GET /v1/bank/statements/{id}/lines&#x60;](#tag/statements/GET/v1/bank/statements/{id}/lines). Afterwards, match it again, to something else, with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match). A completed reconciliation is final, see [&#x60;POST /v1/bank/reconciliations/{id}/complete&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations/{id}/complete).  Error codes: &#x60;line_not_matched&#x60;, &#x60;reconciliation_locked&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  StatementsApi,
} from '@zerpto/sdk';
import type { UnmatchBankStatementLineRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new StatementsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies UnmatchBankStatementLineRequest;

  try {
    const data = await api.unmatchBankStatementLine(body);
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

[**BankStatementLineResponse**](BankStatementLineResponse.md)

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


## uploadBankStatement

> BankStatementResponse uploadBankStatement(id, file, format, idempotencyKey)

Upload a statement file

Uploads a bank statement file for one bank account. Send the &#x60;file&#x60; and its &#x60;format&#x60;, which is &#x60;csv&#x60; or &#x60;mt940&#x60;. The file is read into statement lines, and each line is then matched automatically against payments and journal entries by amount, date and reference. The response is the statement with its period, its opening and closing balance and how many lines were matched. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the bank account &#x60;id&#x60; from [&#x60;GET /v1/bank/accounts&#x60;](#tag/bank-account/GET/v1/bank/accounts). Read the resulting lines with [&#x60;GET /v1/bank/statements/{id}/lines&#x60;](#tag/statements/GET/v1/bank/statements/{id}/lines), and settle those that need attention with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match). When every line is matched, start the reconciliation of the period with [&#x60;POST /v1/bank/reconciliations&#x60;](#tag/bank-reconciliation/POST/v1/bank/reconciliations).  Error codes: &#x60;unsupported_format&#x60;, &#x60;parse_error&#x60; (the message names the row), &#x60;duplicate_statement&#x60; (same bank account and period already imported), &#x60;statement_gap&#x60; (opening balance does not equal the previous closing balance).  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  StatementsApi,
} from '@zerpto/sdk';
import type { UploadBankStatementRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new StatementsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // Blob
    file: BINARY_DATA_HERE,
    // string
    format: format_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies UploadBankStatementRequest;

  try {
    const data = await api.uploadBankStatement(body);
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
| **file** | `Blob` |  | [Defaults to `undefined`] |
| **format** | `csv`, `mt940` |  | [Defaults to `undefined`] [Enum: csv, mt940] |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**BankStatementResponse**](BankStatementResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

