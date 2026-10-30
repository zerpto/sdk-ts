# JournalApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createJournalEntry**](JournalApi.md#createjournalentry) | **POST** /v1/gl/journal-entries | Post a manual journal entry |
| [**getJournalEntry**](JournalApi.md#getjournalentry) | **GET** /v1/gl/journal-entries/{id} | Get a journal entry |
| [**listJournalEntries**](JournalApi.md#listjournalentries) | **GET** /v1/gl/journal-entries | List journal entries |
| [**reverseJournalEntry**](JournalApi.md#reversejournalentry) | **POST** /v1/gl/journal-entries/{id}/reverse | Reverse a journal entry |



## createJournalEntry

> JournalEntryResponse createJournalEntry(journalEntryInput, idempotencyKey)

Post a manual journal entry

Posts a manual journal entry: a dated entry with a description and a list of lines, each debiting or crediting one account. Use it for adjustments that no invoice, payment or stock movement creates. Total debits must equal total credits, and each line has exactly one of &#x60;debit&#x60; or &#x60;credit&#x60; above zero. The entry is posted at once and can no longer be edited or deleted.  The accounts come from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), and only accounts that accept postings can be used. The date decides the period, and an entry cannot be posted into a period that has been closed with [&#x60;POST /v1/gl/periods/{id}/close&#x60;](#tag/general-ledger/POST/v1/gl/periods/{id}/close). If you got something wrong, correct it with [&#x60;POST /v1/gl/journal-entries/{id}/reverse&#x60;](#tag/journal/POST/v1/gl/journal-entries/{id}/reverse) and post a new entry. Send an &#x60;Idempotency-Key&#x60; header so a retry does not post it twice.  Error codes: &#x60;entry_unbalanced&#x60;, &#x60;invalid_line&#x60;, &#x60;unknown_account&#x60;, &#x60;account_not_postable&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  JournalApi,
} from '@zerpto/sdk';
import type { CreateJournalEntryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new JournalApi(config);

  const body = {
    // JournalEntryInput
    journalEntryInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateJournalEntryRequest;

  try {
    const data = await api.createJournalEntry(body);
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
| **journalEntryInput** | [JournalEntryInput](JournalEntryInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**JournalEntryResponse**](JournalEntryResponse.md)

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


## getJournalEntry

> JournalEntryResponse getJournalEntry(id)

Get a journal entry

Returns one journal entry by id: its number, date, description, currency, lines, period, source and status (&#x60;posted&#x60; or &#x60;reversed&#x60;). Use it to open an entry from a report or a ledger, or to see which document created it through &#x60;source&#x60; and &#x60;source_id&#x60;.  The id comes from [&#x60;GET /v1/gl/journal-entries&#x60;](#tag/journal/GET/v1/gl/journal-entries) or from a report line. A &#x60;posted&#x60; entry can be reversed with [&#x60;POST /v1/gl/journal-entries/{id}/reverse&#x60;](#tag/journal/POST/v1/gl/journal-entries/{id}/reverse), and an entry that has been reversed shows the status &#x60;reversed&#x60;.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  JournalApi,
} from '@zerpto/sdk';
import type { GetJournalEntryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new JournalApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetJournalEntryRequest;

  try {
    const data = await api.getJournalEntry(body);
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

[**JournalEntryResponse**](JournalEntryResponse.md)

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


## listJournalEntries

> JournalEntryListResponse listJournalEntries(limit, cursor, sort, createdAfter, createdBefore, accountId, periodId, dateFrom, dateTo, source)

List journal entries

Lists the journal entries of your books, newest first, with their lines. Use it to show the journal, to see everything that touched one account, or to trace the entries behind a report. Filter by &#x60;account_id&#x60;, &#x60;period_id&#x60;, a date range or &#x60;source&#x60;, which tells whether the entry was typed by hand or created by an invoice, a payment, a stock movement, depreciation and so on.  This list can be very long, so it pages with a cursor: pass the &#x60;next_cursor&#x60; of one page as &#x60;cursor&#x60; of the next. Entries are created by [&#x60;POST /v1/gl/journal-entries&#x60;](#tag/journal/POST/v1/gl/journal-entries) and by the documents that post to the ledger. One entry is returned by [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}), and the accounts and periods come from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts) and [&#x60;GET /v1/gl/periods&#x60;](#tag/general-ledger/GET/v1/gl/periods).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;next_cursor&#x60;, &#x60;has_more&#x60;, &#x60;limit&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;next&#x60; (&#x60;next&#x60; is null on the last page). Use &#x60;?cursor&#x3D;&#x60; and &#x60;?limit&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  JournalApi,
} from '@zerpto/sdk';
import type { ListJournalEntriesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new JournalApi(config);

  const body = {
    // number | Page size. (optional)
    limit: 56,
    // string | `next_cursor` from the previous page. (optional)
    cursor: cursor_example,
    // string | Field to sort by. Prefix with `-` for descending. (optional)
    sort: -created_at,
    // Date | Only records created after this time. (optional)
    createdAfter: 2013-10-20T19:20:30+01:00,
    // Date | Only records created before this time. (optional)
    createdBefore: 2013-10-20T19:20:30+01:00,
    // string | Entries touching this account. (optional)
    accountId: accountId_example,
    // string | Filter by period. (optional)
    periodId: periodId_example,
    // Date | Entry date on or after. (optional)
    dateFrom: 2013-10-20,
    // Date | Entry date on or before. (optional)
    dateTo: 2013-10-20,
    // 'manual' | 'ar_invoice' | 'ar_payment' | 'ap_invoice' | 'ap_payment' | 'goods_receipt' | 'delivery' | 'stock_adjustment' | 'bank_adjustment' | 'cash_transfer' | 'expense' | 'income' | 'credit_card_payment' | 'purchase_return' | 'ap_credit_note' | 'ap_credit_note_refund' | 'asset_depreciation' | 'asset_disposal' | 'tax_withholding' | Filter by originating document type. (optional)
    source: source_example,
  } satisfies ListJournalEntriesRequest;

  try {
    const data = await api.listJournalEntries(body);
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
| **limit** | `number` | Page size. | [Optional] [Defaults to `50`] |
| **cursor** | `string` | &#x60;next_cursor&#x60; from the previous page. | [Optional] [Defaults to `undefined`] |
| **sort** | `string` | Field to sort by. Prefix with &#x60;-&#x60; for descending. | [Optional] [Defaults to `undefined`] |
| **createdAfter** | `Date` | Only records created after this time. | [Optional] [Defaults to `undefined`] |
| **createdBefore** | `Date` | Only records created before this time. | [Optional] [Defaults to `undefined`] |
| **accountId** | `string` | Entries touching this account. | [Optional] [Defaults to `undefined`] |
| **periodId** | `string` | Filter by period. | [Optional] [Defaults to `undefined`] |
| **dateFrom** | `Date` | Entry date on or after. | [Optional] [Defaults to `undefined`] |
| **dateTo** | `Date` | Entry date on or before. | [Optional] [Defaults to `undefined`] |
| **source** | `manual`, `ar_invoice`, `ar_payment`, `ap_invoice`, `ap_payment`, `goods_receipt`, `delivery`, `stock_adjustment`, `bank_adjustment`, `cash_transfer`, `expense`, `income`, `credit_card_payment`, `purchase_return`, `ap_credit_note`, `ap_credit_note_refund`, `asset_depreciation`, `asset_disposal`, `tax_withholding` | Filter by originating document type. | [Optional] [Defaults to `undefined`] [Enum: manual, ar_invoice, ar_payment, ap_invoice, ap_payment, goods_receipt, delivery, stock_adjustment, bank_adjustment, cash_transfer, expense, income, credit_card_payment, purchase_return, ap_credit_note, ap_credit_note_refund, asset_depreciation, asset_disposal, tax_withholding] |

### Return type

[**JournalEntryListResponse**](JournalEntryListResponse.md)

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


## reverseJournalEntry

> JournalEntryResponse reverseJournalEntry(id, idempotencyKey)

Reverse a journal entry

Reverses a posted journal entry by creating a new entry with every debit and credit swapped, so the two cancel out. The original is never edited or deleted: it stays in the books with the status &#x60;reversed&#x60;, and the reversing entry is returned. Use it to correct a mistake, then post the right entry again.  The id comes from [&#x60;GET /v1/gl/journal-entries&#x60;](#tag/journal/GET/v1/gl/journal-entries). The reversing entry is posted today, in an open period, and a period that has been closed with [&#x60;POST /v1/gl/periods/{id}/close&#x60;](#tag/general-ledger/POST/v1/gl/periods/{id}/close) accepts nothing more. An entry that came from an invoice, a payment or another document is corrected through that document, not here. Send an &#x60;Idempotency-Key&#x60; header so a retry does not reverse it twice.  Error codes: &#x60;entry_already_reversed&#x60;, &#x60;entry_has_source&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  JournalApi,
} from '@zerpto/sdk';
import type { ReverseJournalEntryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new JournalApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies ReverseJournalEntryRequest;

  try {
    const data = await api.reverseJournalEntry(body);
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

[**JournalEntryResponse**](JournalEntryResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

