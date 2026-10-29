# IncomeApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelIncome**](IncomeApi.md#cancelincome) | **POST** /v1/income/{id}/cancel | Cancel income |
| [**createIncome**](IncomeApi.md#createincome) | **POST** /v1/income | Record income |
| [**deleteIncomeAttachment**](IncomeApi.md#deleteincomeattachment) | **DELETE** /v1/income/{id}/attachments/{attachment_id} | Remove income attachment |
| [**getIncome**](IncomeApi.md#getincome) | **GET** /v1/income/{id} | Get income |
| [**listIncomes**](IncomeApi.md#listincomes) | **GET** /v1/income | List income |
| [**postIncome**](IncomeApi.md#postincome) | **POST** /v1/income/{id}/confirm | Post income to the GL |
| [**updateIncome**](IncomeApi.md#updateincome) | **PATCH** /v1/income/{id} | Update income |
| [**uploadIncomeAttachments**](IncomeApi.md#uploadincomeattachments) | **POST** /v1/income/{id}/attachments | Upload income proof files |
| [**voidIncome**](IncomeApi.md#voidincome) | **POST** /v1/income/{id}/void | Void income |



## cancelIncome

> IncomeResponse cancelIncome(id, idempotencyKey)

Cancel income

Cancels a draft income entry that you no longer want to record. It becomes &#x60;cancelled&#x60;, nothing posts to the GL and its attachments are kept for the record. Only drafts can be cancelled; to reverse a posted entry, use the void call instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/income&#x60;](#tag/income/POST/v1/income) or [&#x60;PATCH /v1/income/{id}&#x60;](#tag/income/PATCH/v1/income/{id}). Once you have called [&#x60;POST /v1/income/{id}/confirm&#x60;](#tag/income/POST/v1/income/{id}/confirm), reverse it with [&#x60;POST /v1/income/{id}/void&#x60;](#tag/income/POST/v1/income/{id}/void). A cancelled entry stays in [&#x60;GET /v1/income&#x60;](#tag/income/GET/v1/income) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;income_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { CancelIncomeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelIncomeRequest;

  try {
    const data = await api.cancelIncome(body);
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

[**IncomeResponse**](IncomeResponse.md)

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


## createIncome

> IncomeResponse createIncome(incomeInput, idempotencyKey)

Record income

Records money received without a sales order or a customer invoice, as a draft. Send the payer as a &#x60;customer_id&#x60;, a free-text &#x60;payer_name&#x60; or both, the &#x60;income_date&#x60;, the &#x60;currency&#x60;, the &#x60;cash_account_id&#x60; it was received into and the receipt lines. Each line has a description, an optional &#x60;item_id&#x60;, its income account, the quantity and the &#x60;unit_price&#x60; with tax included, as printed on a receipt; the line totals, tax and document totals are worked out by the server. Nothing posts until the draft is confirmed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the customer from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers), the cash or bank account and the income accounts from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), an item from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) and a tax rate from [&#x60;GET /v1/tax-rates&#x60;](#tag/tax-and-currencies/GET/v1/tax-rates). Attach the proof of receipt with [&#x60;POST /v1/income/{id}/attachments&#x60;](#tag/income/POST/v1/income/{id}/attachments), fix the draft with [&#x60;PATCH /v1/income/{id}&#x60;](#tag/income/PATCH/v1/income/{id}) or drop it with [&#x60;POST /v1/income/{id}/cancel&#x60;](#tag/income/POST/v1/income/{id}/cancel), and post it with [&#x60;POST /v1/income/{id}/confirm&#x60;](#tag/income/POST/v1/income/{id}/confirm).  A real sale with an agreed price or a customer who needs a tax invoice should go through [&#x60;POST /v1/ar/invoices&#x60;](#tag/customer-invoice/POST/v1/ar/invoices) instead, so receivables and output tax are tracked properly; income is for receipts where that overhead isn\&#39;t worth it. A vendor refund for a returned purchase belongs on the credit note it came from, with [&#x60;POST /v1/ap/credit-notes/{id}/refunds&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/refunds), not here, so it offsets the original expense instead of inflating income.  Error codes: &#x60;payer_required&#x60;, &#x60;unknown_customer&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;unknown_item&#x60;, &#x60;item_stocked&#x60;, &#x60;account_required&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { CreateIncomeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // IncomeInput
    incomeInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateIncomeRequest;

  try {
    const data = await api.createIncome(body);
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
| **incomeInput** | [IncomeInput](IncomeInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**IncomeResponse**](IncomeResponse.md)

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
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## deleteIncomeAttachment

> deleteIncomeAttachment(id, attachmentId)

Remove income attachment

Removes one attached file from an income entry that is still a draft, for example a photo of the wrong receipt. The file is deleted and no longer appears in &#x60;attachments&#x60;. Once the entry is posted its files are part of the record and cannot be removed. The call returns 204 with no body.  The &#x60;id&#x60; is the income entry from [&#x60;GET /v1/income/{id}&#x60;](#tag/income/GET/v1/income/{id}) and the &#x60;attachment_id&#x60; is one of its &#x60;attachments&#x60;. Upload the right file with [&#x60;POST /v1/income/{id}/attachments&#x60;](#tag/income/POST/v1/income/{id}/attachments).  Error codes: &#x60;income_not_draft&#x60;, &#x60;attachment_not_found&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { DeleteIncomeAttachmentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Attachment to remove, from the entry\'s `attachments`.
    attachmentId: attachmentId_example,
  } satisfies DeleteIncomeAttachmentRequest;

  try {
    const data = await api.deleteIncomeAttachment(body);
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
| **attachmentId** | `string` | Attachment to remove, from the entry\&#39;s &#x60;attachments&#x60;. | [Defaults to `undefined`] |

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
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getIncome

> IncomeResponse getIncome(id)

Get income

Returns one income entry by its &#x60;id&#x60;, with the payer, date, cash or bank account, method, reference, status, every line with its account, quantity, prices and tax, the totals, the attached files and the journal entry once posted. Use it to review a draft before posting, to prefill an edit form, or to show a receipt with its booking.  Take the &#x60;id&#x60; from [&#x60;GET /v1/income&#x60;](#tag/income/GET/v1/income) or from the response of [&#x60;POST /v1/income&#x60;](#tag/income/POST/v1/income). While it is a draft, change it with [&#x60;PATCH /v1/income/{id}&#x60;](#tag/income/PATCH/v1/income/{id}) or drop it with [&#x60;POST /v1/income/{id}/cancel&#x60;](#tag/income/POST/v1/income/{id}/cancel); post it with [&#x60;POST /v1/income/{id}/confirm&#x60;](#tag/income/POST/v1/income/{id}/confirm), and reverse a posted one with [&#x60;POST /v1/income/{id}/void&#x60;](#tag/income/POST/v1/income/{id}/void). The booking is read with [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { GetIncomeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetIncomeRequest;

  try {
    const data = await api.getIncome(body);
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

[**IncomeResponse**](IncomeResponse.md)

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


## listIncomes

> IncomeListResponse listIncomes(perPage, page, sort, createdAfter, createdBefore, status, customerId, accountId, cashAccountId, dateFrom, dateTo)

List income

Lists the income you recorded, such as bank interest, a scrap sale or a grant, with the payer, date, status and totals. Use it to review miscellaneous receipts, to find drafts not yet posted, or to check what was received into one account. Filter by &#x60;status&#x60;, &#x60;customer_id&#x60;, &#x60;account_id&#x60;, &#x60;cash_account_id&#x60; or income date, and narrow by creation date.  Take a &#x60;customer_id&#x60; for the filter from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers) and an &#x60;account_id&#x60; from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts) or a &#x60;cash_account_id&#x60; from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts). New income is recorded with [&#x60;POST /v1/income&#x60;](#tag/income/POST/v1/income), and one entry is read with [&#x60;GET /v1/income/{id}&#x60;](#tag/income/GET/v1/income/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { ListIncomesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // string | Field to sort by. Prefix with `-` for descending. (optional)
    sort: -created_at,
    // Date | Only records created after this time. (optional)
    createdAfter: 2013-10-20T19:20:30+01:00,
    // Date | Only records created before this time. (optional)
    createdBefore: 2013-10-20T19:20:30+01:00,
    // 'draft' | 'posted' | 'cancelled' | 'void' | Filter by status. (optional)
    status: status_example,
    // string | Filter by customer. (optional)
    customerId: customerId_example,
    // string | Income with at least one line booked to this account. (optional)
    accountId: accountId_example,
    // string | Income received into this cash or bank account. (optional)
    cashAccountId: cashAccountId_example,
    // Date | Income date on or after. (optional)
    dateFrom: 2013-10-20,
    // Date | Income date on or before. (optional)
    dateTo: 2013-10-20,
  } satisfies ListIncomesRequest;

  try {
    const data = await api.listIncomes(body);
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
| **sort** | `string` | Field to sort by. Prefix with &#x60;-&#x60; for descending. | [Optional] [Defaults to `undefined`] |
| **createdAfter** | `Date` | Only records created after this time. | [Optional] [Defaults to `undefined`] |
| **createdBefore** | `Date` | Only records created before this time. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `posted`, `cancelled`, `void` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted, cancelled, void] |
| **customerId** | `string` | Filter by customer. | [Optional] [Defaults to `undefined`] |
| **accountId** | `string` | Income with at least one line booked to this account. | [Optional] [Defaults to `undefined`] |
| **cashAccountId** | `string` | Income received into this cash or bank account. | [Optional] [Defaults to `undefined`] |
| **dateFrom** | `Date` | Income date on or after. | [Optional] [Defaults to `undefined`] |
| **dateTo** | `Date` | Income date on or before. | [Optional] [Defaults to `undefined`] |

### Return type

[**IncomeListResponse**](IncomeListResponse.md)

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


## postIncome

> IncomeResponse postIncome(id, idempotencyKey)

Post income to the GL

Posts a draft income entry. It creates the journal entry, which debits the cash or bank account with the total and credits each line\&#39;s account with the line subtotal and the output PPN account with the line tax. The status becomes &#x60;posted&#x60; and the entry is locked. The call fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the draft with [&#x60;POST /v1/income&#x60;](#tag/income/POST/v1/income) and [&#x60;PATCH /v1/income/{id}&#x60;](#tag/income/PATCH/v1/income/{id}) first. After posting, the entry shows in [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}), and a bank statement line for the receipt can be matched to the income with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match). Any output PPN booked here still needs its own Faktur Pajak if the receipt is a taxable supply; confirm the tax treatment with your accountant before relying on it for filing. If it was posted by mistake, reverse it with [&#x60;POST /v1/income/{id}/void&#x60;](#tag/income/POST/v1/income/{id}/void).  Error codes: &#x60;income_not_draft&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { PostIncomeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostIncomeRequest;

  try {
    const data = await api.postIncome(body);
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

[**IncomeResponse**](IncomeResponse.md)

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


## updateIncome

> IncomeResponse updateIncome(id, incomeUpdate)

Update income

Changes an income entry that is still a draft. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep, and the totals are worked out again. The same rules as on creation apply. Once the entry is posted, cancelled or void it can no longer be edited, and the call returns 409.  Read the current draft with [&#x60;GET /v1/income/{id}&#x60;](#tag/income/GET/v1/income/{id}) first. When it is right, post it with [&#x60;POST /v1/income/{id}/confirm&#x60;](#tag/income/POST/v1/income/{id}/confirm). To drop it, call [&#x60;POST /v1/income/{id}/cancel&#x60;](#tag/income/POST/v1/income/{id}/cancel).  Error codes: &#x60;income_not_editable&#x60;, &#x60;payer_required&#x60;, &#x60;unknown_customer&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;unknown_item&#x60;, &#x60;item_stocked&#x60;, &#x60;account_required&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { UpdateIncomeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // IncomeUpdate
    incomeUpdate: ...,
  } satisfies UpdateIncomeRequest;

  try {
    const data = await api.updateIncome(body);
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
| **incomeUpdate** | [IncomeUpdate](IncomeUpdate.md) |  | |

### Return type

[**IncomeResponse**](IncomeResponse.md)

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


## uploadIncomeAttachments

> IncomeResponse uploadIncomeAttachments(id, files, idempotencyKey)

Upload income proof files

Attaches proof files to an income entry, such as a bank statement reference or a photo of a handwritten receipt. Send one or more files in a single call; each one is added to the entry\&#39;s &#x60;attachments&#x60; and nothing is replaced. Files can be added while the entry is a draft or posted, but not once it is cancelled or void. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the income entry first with [&#x60;POST /v1/income&#x60;](#tag/income/POST/v1/income). The files are read back with [&#x60;GET /v1/income/{id}&#x60;](#tag/income/GET/v1/income/{id}) as &#x60;attachments&#x60;, each with a short-lived &#x60;download_url&#x60;. While the entry is a draft, a wrong file is removed with [&#x60;DELETE /v1/income/{id}/attachments/{attachment_id}&#x60;](#tag/income/DELETE/v1/income/{id}/attachments/{attachment_id}).  Error codes: &#x60;income_closed&#x60;, &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { UploadIncomeAttachmentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: 'id_example',
    // Array<Blob> | PDF, JPEG or PNG, up to 10 MB each.
    files: [new Blob(['example file content'], { type: 'application/octet-stream' })],
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: 'idempotencyKey_example',
  } satisfies UploadIncomeAttachmentsRequest;

  try {
    const data = await api.uploadIncomeAttachments(body);
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
| **files** | `Array<Blob>` | PDF, JPEG or PNG, up to 10 MB each. | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**IncomeResponse**](IncomeResponse.md)

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


## voidIncome

> IncomeResponse voidIncome(id, idempotencyKey)

Void income

Voids a posted income entry by reversing its journal entry. The status becomes &#x60;void&#x60; and the receipt no longer counts in the income accounts or the cash or bank balance. Use it when income was posted by mistake, with the wrong amount or account, or twice. The entry and its attachments stay on record. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Read the entry first with [&#x60;GET /v1/income/{id}&#x60;](#tag/income/GET/v1/income/{id}). If a bank statement line was matched to it, the line goes back to unmatched, and you match it again with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match). After voiding, record the right entry with [&#x60;POST /v1/income&#x60;](#tag/income/POST/v1/income).  Error codes: &#x60;income_not_voidable&#x60;, &#x60;reconciliation_locked&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  IncomeApi,
} from '@zerpto/sdk';
import type { VoidIncomeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new IncomeApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidIncomeRequest;

  try {
    const data = await api.voidIncome(body);
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

[**IncomeResponse**](IncomeResponse.md)

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

