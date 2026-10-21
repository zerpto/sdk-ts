# CustomerInvoiceApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createArInvoice**](CustomerInvoiceApi.md#createarinvoice) | **POST** /v1/ar/invoices | Create invoice |
| [**getArInvoice**](CustomerInvoiceApi.md#getarinvoice) | **GET** /v1/ar/invoices/{id} | Get invoice |
| [**listArInvoices**](CustomerInvoiceApi.md#listarinvoices) | **GET** /v1/ar/invoices | List invoices |
| [**postArInvoice**](CustomerInvoiceApi.md#postarinvoice) | **POST** /v1/ar/invoices/{id}/confirm | Post invoice to the GL |
| [**updateArInvoice**](CustomerInvoiceApi.md#updatearinvoice) | **PATCH** /v1/ar/invoices/{id} | Update invoice |
| [**voidArInvoice**](CustomerInvoiceApi.md#voidarinvoice) | **POST** /v1/ar/invoices/{id}/void | Void invoice |



## createArInvoice

> ArInvoiceResponse createArInvoice(arInvoiceInput, idempotencyKey)

Create invoice

Creates an invoice in &#x60;draft&#x60; for one customer. Send the &#x60;customer_id&#x60;, the &#x60;invoice_date&#x60;, the &#x60;currency&#x60; and at least one line with a description, quantity and unit price; &#x60;due_date&#x60; and &#x60;notes&#x60; are optional, and the due date defaults from the customer\&#39;s payment terms. The server numbers the invoice and works out each line\&#39;s subtotal and tax, and the &#x60;subtotal&#x60;, &#x60;tax_total&#x60;, &#x60;total&#x60; and &#x60;amount_due&#x60;. Nothing is booked until you post it. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;customer_id&#x60; from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers), and the &#x60;item_id&#x60;, &#x60;tax_rate_id&#x60; and &#x60;account_id&#x60; of each line from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), the tax rates and the chart of accounts. Edit the draft with [&#x60;PATCH /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/PATCH/v1/ar/invoices/{id}), then post it with [&#x60;POST /v1/ar/invoices/{id}/confirm&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/confirm). A draft made from goods you delivered comes from [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice) instead.  Error codes: &#x60;unknown_customer&#x60;, &#x60;customer_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerInvoiceApi,
} from '@zerpto/sdk';
import type { CreateArInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerInvoiceApi(config);

  const body = {
    // ArInvoiceInput
    arInvoiceInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateArInvoiceRequest;

  try {
    const data = await api.createArInvoice(body);
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
| **arInvoiceInput** | [ArInvoiceInput](ArInvoiceInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ArInvoiceResponse**](ArInvoiceResponse.md)

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


## getArInvoice

> ArInvoiceResponse getArInvoice(id)

Get invoice

Returns one invoice by its &#x60;id&#x60;, with its customer, status, dates, currency, notes, every line, the totals and the amount still due. Once posted, &#x60;journal_entry_id&#x60; points to the entry it booked. Use it to show the invoice, to prefill an edit form, or to check how much is still unpaid.  Take the &#x60;id&#x60; from [&#x60;GET /v1/ar/invoices&#x60;](#tag/customer-invoice/GET/v1/ar/invoices) or from the response of [&#x60;POST /v1/ar/invoices&#x60;](#tag/customer-invoice/POST/v1/ar/invoices). While the invoice is a &#x60;draft&#x60;, change it with [&#x60;PATCH /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/PATCH/v1/ar/invoices/{id}); post it with [&#x60;POST /v1/ar/invoices/{id}/confirm&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/confirm), or reverse a posted one with [&#x60;POST /v1/ar/invoices/{id}/void&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/void). Payments that settle it are recorded with [&#x60;POST /v1/ar/payments&#x60;](#tag/accounts-receivable/POST/v1/ar/payments).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerInvoiceApi,
} from '@zerpto/sdk';
import type { GetArInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerInvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetArInvoiceRequest;

  try {
    const data = await api.getArInvoice(body);
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

[**ArInvoiceResponse**](ArInvoiceResponse.md)

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


## listArInvoices

> ArInvoiceListResponse listArInvoices(perPage, page, sort, createdAfter, createdBefore, status, customerId, dueBefore)

List invoices

Lists the invoices you have issued to customers, with status, dates, currency, totals and the amount still due. Use it to follow what customers owe, to find invoices that are overdue, or to review one customer\&#39;s billing. Filter by &#x60;status&#x60;, &#x60;customer_id&#x60; or &#x60;due_before&#x60; and narrow by creation date.  Get a &#x60;customer_id&#x60; for the filter from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). New invoices are made with [&#x60;POST /v1/ar/invoices&#x60;](#tag/customer-invoice/POST/v1/ar/invoices), or from delivered goods with [&#x60;POST /v1/sales/orders/{id}/invoice&#x60;](#tag/sales/POST/v1/sales/orders/{id}/invoice), and one invoice is read with [&#x60;GET /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/GET/v1/ar/invoices/{id}). When a customer pays, record it with [&#x60;POST /v1/ar/payments&#x60;](#tag/accounts-receivable/POST/v1/ar/payments) and allocate it to the invoices it settles.  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CustomerInvoiceApi,
} from '@zerpto/sdk';
import type { ListArInvoicesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerInvoiceApi(config);

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
    // string | Filter by customer. (optional)
    customerId: customerId_example,
    // Date | Due on or before this date. (optional)
    dueBefore: 2013-10-20,
  } satisfies ListArInvoicesRequest;

  try {
    const data = await api.listArInvoices(body);
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
| **customerId** | `string` | Filter by customer. | [Optional] [Defaults to `undefined`] |
| **dueBefore** | `Date` | Due on or before this date. | [Optional] [Defaults to `undefined`] |

### Return type

[**ArInvoiceListResponse**](ArInvoiceListResponse.md)

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


## postArInvoice

> ArInvoiceResponse postArInvoice(id, idempotencyKey)

Post invoice to the GL

Posts a draft invoice. This creates the journal entry for the sale and the tax, locks the invoice so it can no longer be edited, and sets its status to &#x60;posted&#x60; with the amount due. Use it once the invoice is ready to send to the customer. It fails with 422 if the accounting period is closed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the invoice with [&#x60;POST /v1/ar/invoices&#x60;](#tag/customer-invoice/POST/v1/ar/invoices) and [&#x60;PATCH /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/PATCH/v1/ar/invoices/{id}) before you post it. After posting, record what the customer pays with [&#x60;POST /v1/ar/payments&#x60;](#tag/accounts-receivable/POST/v1/ar/payments), which moves the invoice to &#x60;partially_paid&#x60; and then &#x60;paid&#x60;. If it was posted by mistake, [&#x60;POST /v1/ar/invoices/{id}/void&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/void) reverses it while no payment is allocated.  Error codes: &#x60;invoice_not_postable&#x60;, &#x60;invoice_has_no_lines&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerInvoiceApi,
} from '@zerpto/sdk';
import type { PostArInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerInvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostArInvoiceRequest;

  try {
    const data = await api.postArInvoice(body);
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

[**ArInvoiceResponse**](ArInvoiceResponse.md)

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


## updateArInvoice

> ArInvoiceResponse updateArInvoice(id, arInvoiceUpdate)

Update invoice

Changes an invoice that is still a &#x60;draft&#x60;. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep. Totals are worked out again from the new lines. A posted invoice can no longer be edited, and the call returns 409; reverse it with a void instead.  Read the current invoice with [&#x60;GET /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/GET/v1/ar/invoices/{id}) first, and take new &#x60;item_id&#x60; or &#x60;customer_id&#x60; values from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) or [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers). When the draft is right, post it with [&#x60;POST /v1/ar/invoices/{id}/confirm&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/confirm). To undo an invoice that was already posted, call [&#x60;POST /v1/ar/invoices/{id}/void&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/void).  Error codes: &#x60;invoice_not_editable&#x60;, &#x60;unknown_customer&#x60;, &#x60;customer_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerInvoiceApi,
} from '@zerpto/sdk';
import type { UpdateArInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerInvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ArInvoiceUpdate
    arInvoiceUpdate: ...,
  } satisfies UpdateArInvoiceRequest;

  try {
    const data = await api.updateArInvoice(body);
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
| **arInvoiceUpdate** | [ArInvoiceUpdate](ArInvoiceUpdate.md) |  | |

### Return type

[**ArInvoiceResponse**](ArInvoiceResponse.md)

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


## voidArInvoice

> ArInvoiceResponse voidArInvoice(id, idempotencyKey)

Void invoice

Voids a posted invoice by reversing its journal entry, and its status becomes &#x60;void&#x60;. Use it when an invoice was issued by mistake; the invoice stays on record and is never deleted. It is not allowed once a payment has been allocated to it. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Read the invoice with [&#x60;GET /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/GET/v1/ar/invoices/{id}) to see its status and amount due. If a payment is already allocated, look it up with [&#x60;GET /v1/ar/payments&#x60;](#tag/accounts-receivable/GET/v1/ar/payments) and deal with the payment first. After voiding, issue a corrected invoice with [&#x60;POST /v1/ar/invoices&#x60;](#tag/customer-invoice/POST/v1/ar/invoices).  Error codes: &#x60;invoice_not_voidable&#x60;, &#x60;payment_allocated&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomerInvoiceApi,
} from '@zerpto/sdk';
import type { VoidArInvoiceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomerInvoiceApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidArInvoiceRequest;

  try {
    const data = await api.voidArInvoice(body);
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

[**ArInvoiceResponse**](ArInvoiceResponse.md)

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

