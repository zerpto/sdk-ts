# InvoiceApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createApInvoice**](InvoiceApi.md#createapinvoice) | **POST** /v1/ap/invoices | Create invoice |
| [**getApInvoice**](InvoiceApi.md#getapinvoice) | **GET** /v1/ap/invoices/{id} | Get ApInvoice |
| [**listApInvoices**](InvoiceApi.md#listapinvoices) | **GET** /v1/ap/invoices | List invoices |
| [**postApInvoice**](InvoiceApi.md#postapinvoice) | **POST** /v1/ap/invoices/{id}/confirm | Post invoice to the GL |
| [**updateApInvoice**](InvoiceApi.md#updateapinvoice) | **PATCH** /v1/ap/invoices/{id} | Update ApInvoice |
| [**voidApInvoice**](InvoiceApi.md#voidapinvoice) | **POST** /v1/ap/invoices/{id}/void | Void invoice |



## createApInvoice

> ApInvoiceResponse createApInvoice(apInvoiceInput, idempotencyKey)

Create invoice

Creates a draft vendor bill by hand. Send the &#x60;vendor_id&#x60;, the &#x60;invoice_date&#x60;, the &#x60;currency&#x60; and at least one line with a description, quantity and unit price; the &#x60;due_date&#x60; defaults from the vendor\&#39;s payment terms. Use it for costs that have no purchase order or goods receipt, such as rent, services or utilities. Totals are worked out from the lines. A line may carry a &#x60;receipt_line_id&#x60; to bill goods that were received, but a receipt can be on one bill only. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;vendor_id&#x60; from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), the &#x60;item_id&#x60; and &#x60;tax_rate_id&#x60; of a line from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), and the &#x60;account_id&#x60; from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). A file for &#x60;document_id&#x60; comes from [&#x60;POST /v1/purchasing/invoice-documents&#x60;](#tag/purchase-bill/POST/v1/purchasing/invoice-documents). To bill goods you received, [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) and [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills) fill the lines from the receipts for you. Edit the draft with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}), then call [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm), and pay it with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments).  Error codes: &#x60;unknown_vendor&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;, &#x60;receipt_not_posted&#x60;, &#x60;receipt_already_billed&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;document_already_used&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  InvoiceApi,
} from '@zerpto/sdk';
import type { CreateApInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InvoiceApi(config);

  const body = {
    // ApInvoiceInput
    apInvoiceInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateApInvoiceRequest;

  try {
    const data = await api.createApInvoice(body);
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
| **apInvoiceInput** | [ApInvoiceInput](ApInvoiceInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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


## getApInvoice

> ApInvoiceResponse getApInvoice(id)

Get ApInvoice

Returns one vendor bill by its &#x60;id&#x60;, with the vendor, the vendor\&#39;s own invoice number, dates, status, every line, the totals, the amount still due, the journal entry once posted, and the receipts and uploaded file behind it. Use it to show a bill, to prefill an edit form, or to check how much is still owed.  Take the &#x60;id&#x60; from [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices) or from the response of [&#x60;POST /v1/ap/invoices&#x60;](#tag/invoice/POST/v1/ap/invoices). A draft is changed with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}), posted with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm) and reversed with [&#x60;POST /v1/ap/invoices/{id}/void&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/void). For a bill made from receipts, [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match) shows how it compares with the order and the receipts. Payments against it are listed with [&#x60;GET /v1/ap/payments&#x60;](#tag/accounts-payable/GET/v1/ap/payments).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  InvoiceApi,
} from '@zerpto/sdk';
import type { GetApInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetApInvoiceRequest;

  try {
    const data = await api.getApInvoice(body);
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

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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


## listApInvoices

> ApInvoiceListResponse listApInvoices(perPage, page, sort, createdAfter, createdBefore, status, vendorId, dueBefore)

List invoices

Lists the vendor bills in your books, with vendor, dates, status, totals and the amount still due. Use it to see what you owe, which bills are overdue or waiting to be paid, and which are still drafts. Filter by &#x60;status&#x60;, &#x60;vendor_id&#x60; or &#x60;due_before&#x60;, and narrow by creation date. The &#x60;amount_due&#x60; of each bill is what is left after payments.  Take a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). New bills come from [&#x60;POST /v1/ap/invoices&#x60;](#tag/invoice/POST/v1/ap/invoices), or from goods you received with [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) and [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills). A bill with an amount due is paid with [&#x60;POST /v1/ap/payments&#x60;](#tag/accounts-payable/POST/v1/ap/payments), and one bill is read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  InvoiceApi,
} from '@zerpto/sdk';
import type { ListApInvoicesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InvoiceApi(config);

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
    // 'draft' | 'posted' | 'partially_paid' | 'paid' | 'void' | Filter by status. (optional)
    status: status_example,
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
    // Date | Due on or before this date. (optional)
    dueBefore: 2013-10-20,
  } satisfies ListApInvoicesRequest;

  try {
    const data = await api.listApInvoices(body);
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
| **status** | `draft`, `posted`, `partially_paid`, `paid`, `void` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: draft, posted, partially_paid, paid, void] |
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |
| **dueBefore** | `Date` | Due on or before this date. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApInvoiceListResponse**](ApInvoiceListResponse.md)

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


## postApInvoice

> ApInvoiceResponse postApInvoice(id, idempotencyKey)

Post invoice to the GL

Posts a draft bill. It creates the journal entry, sets the status to &#x60;posted&#x60; and locks the bill, so it can no longer be edited. The call fails with 422 if the period is closed. For a bill made from goods receipts, posting also runs the three-way match against the order and the receipts, using the tolerances in the purchasing settings, and fails with &#x60;three_way_mismatch&#x60; if a line is over tolerance. Differences within tolerance are booked to the variance account. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the draft with [&#x60;POST /v1/ap/invoices&#x60;](#tag/invoice/POST/v1/ap/invoices) and [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}) first. For a bill made from receipts, check it before you post with [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match); the tolerances are read with [&#x60;GET /v1/purchasing/settings&#x60;](#tag/purchasing/GET/v1/purchasing/settings). If &#x60;apply_down_payments&#x60; is set, the unapplied down payments of the related orders are applied now. After posting, pay the bill with [&#x60;POST /v1/ap/payments&#x60;](#tag/accounts-payable/POST/v1/ap/payments), or reverse it with [&#x60;POST /v1/ap/invoices/{id}/void&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/void).  Error codes: &#x60;invoice_not_draft&#x60;, &#x60;period_closed&#x60;, &#x60;three_way_mismatch&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  InvoiceApi,
} from '@zerpto/sdk';
import type { PostApInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostApInvoiceRequest;

  try {
    const data = await api.postApInvoice(body);
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

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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


## updateApInvoice

> ApInvoiceResponse updateApInvoice(id, apInvoiceUpdate)

Update ApInvoice

Changes a bill that is still a draft. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep, and the totals are worked out again. Once the bill is posted it can no longer be edited, and the call returns 409. The same rules as on creation apply: a receipt can be on one bill only, and a file can back one bill only.  Read the current bill first with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}). For a bill made from receipts, check the differences with [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match) before you post it. When it is ready, call [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm). A bill that has been posted by mistake is reversed with [&#x60;POST /v1/ap/invoices/{id}/void&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/void), which is not allowed once a payment is allocated to it.  Error codes: &#x60;invoice_not_editable&#x60;, &#x60;unknown_vendor&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;, &#x60;receipt_not_posted&#x60;, &#x60;receipt_already_billed&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;document_already_used&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  InvoiceApi,
} from '@zerpto/sdk';
import type { UpdateApInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ApInvoiceUpdate
    apInvoiceUpdate: ...,
  } satisfies UpdateApInvoiceRequest;

  try {
    const data = await api.updateApInvoice(body);
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
| **apInvoiceUpdate** | [ApInvoiceUpdate](ApInvoiceUpdate.md) |  | |

### Return type

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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


## voidApInvoice

> ApInvoiceResponse voidApInvoice(id, idempotencyKey)

Void invoice

Voids a posted bill by reversing its journal entry. The status becomes &#x60;void&#x60;, the bill no longer counts as owed, and the goods receipts it covered become unbilled again, so they can be billed on a new bill. This is not allowed once a payment has been allocated to the bill. Use it when a bill was posted by mistake or the vendor cancelled the invoice. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  If the bill has been paid, remove or reallocate the payment first; payments are made with [&#x60;POST /v1/ap/payments&#x60;](#tag/accounts-payable/POST/v1/ap/payments). To reduce what you owe without voiding, record a credit note with [&#x60;POST /v1/ap/credit-notes&#x60;](#tag/accounts-payable/POST/v1/ap/credit-notes). After voiding, create the right bill with [&#x60;POST /v1/ap/invoices&#x60;](#tag/invoice/POST/v1/ap/invoices), or with [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) or [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills) from the same receipts, which are listed by [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts).  Error codes: &#x60;invoice_not_posted&#x60;, &#x60;payment_allocated&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  InvoiceApi,
} from '@zerpto/sdk';
import type { VoidApInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new InvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidApInvoiceRequest;

  try {
    const data = await api.voidApInvoice(body);
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

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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

