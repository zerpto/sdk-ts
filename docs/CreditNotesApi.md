# CreditNotesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**allocateApCreditNote**](CreditNotesApi.md#allocateapcreditnote) | **POST** /v1/ap/credit-notes/{id}/allocations | Apply a credit note to bills |
| [**createApCreditNote**](CreditNotesApi.md#createapcreditnote) | **POST** /v1/ap/credit-notes | Create credit note |
| [**getApCreditNote**](CreditNotesApi.md#getapcreditnote) | **GET** /v1/ap/credit-notes/{id} | Get credit note |
| [**listApCreditNotes**](CreditNotesApi.md#listapcreditnotes) | **GET** /v1/ap/credit-notes | List credit notes |
| [**postApCreditNote**](CreditNotesApi.md#postapcreditnote) | **POST** /v1/ap/credit-notes/{id}/confirm | Post credit note to the GL |
| [**refundApCreditNote**](CreditNotesApi.md#refundapcreditnote) | **POST** /v1/ap/credit-notes/{id}/refunds | Record a vendor refund |
| [**removeApCreditNoteAllocation**](CreditNotesApi.md#removeapcreditnoteallocation) | **DELETE** /v1/ap/credit-notes/{id}/allocations/{invoice_id} | Remove a credit allocation |
| [**updateApCreditNote**](CreditNotesApi.md#updateapcreditnote) | **PATCH** /v1/ap/credit-notes/{id} | Update credit note |
| [**voidApCreditNote**](CreditNotesApi.md#voidapcreditnote) | **POST** /v1/ap/credit-notes/{id}/void | Void credit note |



## allocateApCreditNote

> ApCreditNoteResponse allocateApCreditNote(id, allocationsInput, idempotencyKey)

Apply a credit note to bills

Uses the unapplied balance of a posted credit note to reduce what you owe on one or more posted bills of the same vendor, with a different amount for each. The total cannot exceed the unapplied balance, and each amount cannot exceed the bill\&#39;s &#x60;amount_due&#x60;. The limits are the same as for payment allocations. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  The credit note must be posted with [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm), and the bills with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm); find them with [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices). Undo one application with [&#x60;DELETE /v1/ap/credit-notes/{id}/allocations/{invoice_id}&#x60;](#tag/credit-notes/DELETE/v1/ap/credit-notes/{id}/allocations/{invoice_id}). To apply a payment balance instead of a credit, use [&#x60;POST /v1/ap/payments/{id}/allocations&#x60;](#tag/payment/POST/v1/ap/payments/{id}/allocations).  Error codes: &#x60;exceeds_unapplied&#x60;, &#x60;exceeds_amount_due&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;not_posted&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { AllocateApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // AllocationsInput
    allocationsInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies AllocateApCreditNoteRequest;

  try {
    const data = await api.allocateApCreditNote(body);
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
| **allocationsInput** | [AllocationsInput](AllocationsInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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


## createApCreditNote

> ApCreditNoteResponse createApCreditNote(apCreditNoteInput, idempotencyKey)

Create credit note

Creates a draft credit note, a credit from a vendor for goods you returned, an amount that was over-billed, a discount or another reason. Send the &#x60;vendor_id&#x60;, the &#x60;credit_note_date&#x60;, the &#x60;currency&#x60;, the &#x60;reason&#x60; and at least one line. For &#x60;overbilling&#x60; the &#x60;ap_invoice_id&#x60; is required and the bill must be posted. You can also create it by hand when no return exists. It is created as a draft by itself when a purchase return on an already billed receipt is posted. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the vendor from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), the bill from [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices), and the accounts of the lines from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). A file for &#x60;document_id&#x60; comes from [&#x60;POST /v1/purchasing/invoice-documents&#x60;](#tag/purchase-bill/POST/v1/purchasing/invoice-documents). If the bill is still a draft, edit the bill with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}) instead. Fix the draft with [&#x60;PATCH /v1/ap/credit-notes/{id}&#x60;](#tag/credit-notes/PATCH/v1/ap/credit-notes/{id}), then call [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm). Afterwards apply it to bills with [&#x60;POST /v1/ap/credit-notes/{id}/allocations&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/allocations), or record the money coming back with [&#x60;POST /v1/ap/credit-notes/{id}/refunds&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/refunds).  Error codes: &#x60;unknown_vendor&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;bill_not_posted&#x60;, &#x60;exceeds_bill_total&#x60;, &#x60;vendor_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { CreateApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // ApCreditNoteInput
    apCreditNoteInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateApCreditNoteRequest;

  try {
    const data = await api.createApCreditNote(body);
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
| **apCreditNoteInput** | [ApCreditNoteInput](ApCreditNoteInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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


## getApCreditNote

> ApCreditNoteResponse getApCreditNote(id)

Get credit note

Returns one vendor credit note by its &#x60;id&#x60;, with the vendor, the vendor\&#39;s own number, status, reason, the bill or purchase return it relates to, every line, the totals, the unapplied amount, the bills it was applied to and the refunds received. Use it to show a credit note or to see how much of it can still be used.  Take the &#x60;id&#x60; from [&#x60;GET /v1/ap/credit-notes&#x60;](#tag/credit-notes/GET/v1/ap/credit-notes) or from the response of [&#x60;POST /v1/ap/credit-notes&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes). A draft is changed with [&#x60;PATCH /v1/ap/credit-notes/{id}&#x60;](#tag/credit-notes/PATCH/v1/ap/credit-notes/{id}) and posted with [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm). The bills it was applied to are read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { GetApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetApCreditNoteRequest;

  try {
    const data = await api.getApCreditNote(body);
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

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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


## listApCreditNotes

> ApCreditNoteListResponse listApCreditNotes(perPage, page, sort, createdAfter, createdBefore, vendorId, status, reason, apInvoiceId)

List credit notes

Lists the credit notes you received from vendors, with their reason, status, totals and the part not yet used. Use it to see which credits are still open, to find credits for a returned delivery or an over-billed amount, or to follow up refunds. Filter by &#x60;vendor_id&#x60;, &#x60;status&#x60;, &#x60;reason&#x60; or &#x60;ap_invoice_id&#x60;, and narrow by creation date.  Take a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors) and an &#x60;ap_invoice_id&#x60; from [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices). New credit notes are made with [&#x60;POST /v1/ap/credit-notes&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes), and one is read with [&#x60;GET /v1/ap/credit-notes/{id}&#x60;](#tag/credit-notes/GET/v1/ap/credit-notes/{id}). A credit with an unapplied balance is used on bills with [&#x60;POST /v1/ap/credit-notes/{id}/allocations&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/allocations), or paid back with [&#x60;POST /v1/ap/credit-notes/{id}/refunds&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/refunds).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { ListApCreditNotesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

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
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
    // 'draft' | 'posted' | 'partially_applied' | 'applied' | 'void' | Filter by status. (optional)
    status: status_example,
    // 'return' | 'overbilling' | 'discount' | 'other' | Filter by reason. (optional)
    reason: reason_example,
    // string | Filter by the bill being credited. (optional)
    apInvoiceId: apInvoiceId_example,
  } satisfies ListApCreditNotesRequest;

  try {
    const data = await api.listApCreditNotes(body);
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
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |
| **status** | `draft`, `posted`, `partially_applied`, `applied`, `void` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted, partially_applied, applied, void] |
| **reason** | `return`, `overbilling`, `discount`, `other` | Filter by reason. | [Optional] [Defaults to `undefined`] [Enum: return, overbilling, discount, other] |
| **apInvoiceId** | `string` | Filter by the bill being credited. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApCreditNoteListResponse**](ApCreditNoteListResponse.md)

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


## postApCreditNote

> ApCreditNoteResponse postApCreditNote(id, idempotencyKey)

Post credit note to the GL

Posts a draft credit note. It debits AP and credits the line accounts: GRNI for returns, expense or inventory otherwise, and it reverses input PPN on taxed lines. The credit note then has an unapplied balance that you use on bills or get refunded. The call fails with 422 if the period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the draft with [&#x60;POST /v1/ap/credit-notes&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes), or let it be created by [&#x60;POST /v1/purchasing/returns/{id}/confirm&#x60;](#tag/return/POST/v1/purchasing/returns/{id}/confirm) when the returned goods were already billed. After posting, apply it to open bills with [&#x60;POST /v1/ap/credit-notes/{id}/allocations&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/allocations), or record a refund from the vendor with [&#x60;POST /v1/ap/credit-notes/{id}/refunds&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/refunds). A posted credit note is reversed with [&#x60;POST /v1/ap/credit-notes/{id}/void&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/void).  Error codes: &#x60;credit_note_not_draft&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { PostApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostApCreditNoteRequest;

  try {
    const data = await api.postApCreditNote(body);
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

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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


## refundApCreditNote

> ApCreditNoteResponse refundApCreditNote(id, apCreditNoteRefundInput, idempotencyKey)

Record a vendor refund

Records money received from the vendor against the unapplied balance of a credit note, debiting the bank and crediting AP. Send the &#x60;date&#x60;, the &#x60;amount&#x60;, the &#x60;bank_account_id&#x60; that received it and an optional &#x60;reference&#x60;. The amount cannot exceed the unapplied balance. Use it when the vendor pays the credit back instead of lowering a bill. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  The credit note must be posted with [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm). Take the bank account from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). The refund appears in &#x60;refunds&#x60; of [&#x60;GET /v1/ap/credit-notes/{id}&#x60;](#tag/credit-notes/GET/v1/ap/credit-notes/{id}) and lowers the unapplied balance. A credit note with a refund cannot be voided with [&#x60;POST /v1/ap/credit-notes/{id}/void&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/void).  Error codes: &#x60;exceeds_unapplied&#x60;, &#x60;not_posted&#x60;, &#x60;unknown_bank_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { RefundApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ApCreditNoteRefundInput
    apCreditNoteRefundInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies RefundApCreditNoteRequest;

  try {
    const data = await api.refundApCreditNote(body);
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
| **apCreditNoteRefundInput** | [ApCreditNoteRefundInput](ApCreditNoteRefundInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## removeApCreditNoteAllocation

> removeApCreditNoteAllocation(id, invoiceId)

Remove a credit allocation

Takes back one application of a credit note from a bill. The amount returns to the credit note\&#39;s unapplied balance and the bill\&#39;s &#x60;amount_due&#x60; is restored, so the bill owes that amount again. Use it when the credit was applied to the wrong bill, or before voiding the credit note. The call returns 204 with no body.  The &#x60;id&#x60; is the credit note from [&#x60;GET /v1/ap/credit-notes/{id}&#x60;](#tag/credit-notes/GET/v1/ap/credit-notes/{id}) and the &#x60;invoice_id&#x60; is the bill named in its &#x60;allocations&#x60;. After removing, apply the balance again with [&#x60;POST /v1/ap/credit-notes/{id}/allocations&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/allocations), or void the credit note with [&#x60;POST /v1/ap/credit-notes/{id}/void&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/void).  Error codes: &#x60;allocation_not_found&#x60;, &#x60;period_closed&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { RemoveApCreditNoteAllocationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Bill the allocation is on.
    invoiceId: invoiceId_example,
  } satisfies RemoveApCreditNoteAllocationRequest;

  try {
    const data = await api.removeApCreditNoteAllocation(body);
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
| **invoiceId** | `string` | Bill the allocation is on. | [Defaults to `undefined`] |

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
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## updateApCreditNote

> ApCreditNoteResponse updateApCreditNote(id, apCreditNoteUpdate)

Update credit note

Changes a credit note that is still a draft. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep. A credit note that is posted can no longer be edited, and the call returns 409; reverse it with the void call and create a new one.  Read the current credit note with [&#x60;GET /v1/ap/credit-notes/{id}&#x60;](#tag/credit-notes/GET/v1/ap/credit-notes/{id}) first. When it is ready, call [&#x60;POST /v1/ap/credit-notes/{id}/confirm&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/confirm). To undo one that was posted by mistake, use [&#x60;POST /v1/ap/credit-notes/{id}/void&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes/{id}/void), which is not allowed while it has allocations or refunds.  Error codes: &#x60;credit_note_not_editable&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;exceeds_bill_total&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { UpdateApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ApCreditNoteUpdate
    apCreditNoteUpdate: ...,
  } satisfies UpdateApCreditNoteRequest;

  try {
    const data = await api.updateApCreditNote(body);
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
| **apCreditNoteUpdate** | [ApCreditNoteUpdate](ApCreditNoteUpdate.md) |  | |

### Return type

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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


## voidApCreditNote

> ApCreditNoteResponse voidApCreditNote(id, idempotencyKey)

Void credit note

Voids a posted credit note by reversing its journal entry. The status becomes &#x60;void&#x60; and the credit no longer reduces what you owe. This is not allowed while the credit note has allocations or refunds, so remove them first. Use it when a credit note was posted by mistake. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Remove each application with [&#x60;DELETE /v1/ap/credit-notes/{id}/allocations/{invoice_id}&#x60;](#tag/credit-notes/DELETE/v1/ap/credit-notes/{id}/allocations/{invoice_id}). A refund cannot be removed here, so a credit note with a refund stays posted. After voiding, create the right one with [&#x60;POST /v1/ap/credit-notes&#x60;](#tag/credit-notes/POST/v1/ap/credit-notes). The bills it had reduced are read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: &#x60;has_applications&#x60;, &#x60;credit_note_not_posted&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CreditNotesApi,
} from '@zerpto/sdk';
import type { VoidApCreditNoteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CreditNotesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidApCreditNoteRequest;

  try {
    const data = await api.voidApCreditNote(body);
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

[**ApCreditNoteResponse**](ApCreditNoteResponse.md)

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

