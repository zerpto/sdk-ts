# ExpensesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**cancelExpense**](ExpensesApi.md#cancelexpense) | **POST** /v1/expenses/{id}/cancel | Cancel expense |
| [**createExpense**](ExpensesApi.md#createexpense) | **POST** /v1/expenses | Record an expense |
| [**deleteExpenseAttachment**](ExpensesApi.md#deleteexpenseattachment) | **DELETE** /v1/expenses/{id}/attachments/{attachment_id} | Remove expense attachment |
| [**getExpense**](ExpensesApi.md#getexpense) | **GET** /v1/expenses/{id} | Get expense |
| [**listExpenses**](ExpensesApi.md#listexpenses) | **GET** /v1/expenses | List expenses |
| [**postExpense**](ExpensesApi.md#postexpense) | **POST** /v1/expenses/{id}/confirm | Post expense to the GL |
| [**updateExpense**](ExpensesApi.md#updateexpense) | **PATCH** /v1/expenses/{id} | Update expense |
| [**uploadExpenseAttachments**](ExpensesApi.md#uploadexpenseattachments) | **POST** /v1/expenses/{id}/attachments | Upload expense files |
| [**voidExpense**](ExpensesApi.md#voidexpense) | **POST** /v1/expenses/{id}/void | Void expense |



## cancelExpense

> ExpenseResponse cancelExpense(id, idempotencyKey)

Cancel expense

Cancels a draft expense that you no longer want to record. The expense becomes &#x60;cancelled&#x60;, nothing posts to the GL and its attachments are kept for the record. Only drafts can be cancelled; to reverse a posted expense, use the void call instead. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Use it on a draft from [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses) or [&#x60;PATCH /v1/expenses/{id}&#x60;](#tag/expenses/PATCH/v1/expenses/{id}). Once you have called [&#x60;POST /v1/expenses/{id}/confirm&#x60;](#tag/expenses/POST/v1/expenses/{id}/confirm), reverse the expense with [&#x60;POST /v1/expenses/{id}/void&#x60;](#tag/expenses/POST/v1/expenses/{id}/void). A cancelled expense stays in [&#x60;GET /v1/expenses&#x60;](#tag/expenses/GET/v1/expenses) with the status &#x60;cancelled&#x60;.  Error codes: &#x60;expense_not_cancellable&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { CancelExpenseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CancelExpenseRequest;

  try {
    const data = await api.cancelExpense(body);
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

[**ExpenseResponse**](ExpenseResponse.md)

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


## createExpense

> ExpenseResponse createExpense(expenseInput, idempotencyKey)

Record an expense

Records money spent without a purchase order or a vendor bill, as a draft. Send the payee as a &#x60;vendor_id&#x60;, a free-text &#x60;payee_name&#x60; or both, the &#x60;expense_date&#x60;, the &#x60;currency&#x60;, &#x60;paid_via&#x60; and the receipt lines. &#x60;paid_via&#x60; is a &#x60;cash_account_id&#x60; when the money left straight away, or a &#x60;credit_card_id&#x60; when it was charged to a card instead, in which case no cash moves until the card is paid down. Each line has a description, an optional &#x60;item_id&#x60;, its expense account, the quantity and the &#x60;unit_price&#x60; with tax included, as printed on a receipt; the line totals, tax and document totals are worked out by the server. A line whose &#x60;item_id&#x60; is a stocked item also receives that quantity into &#x60;warehouse_id&#x60; once posted, booked to the tenant\&#39;s inventory account instead of a free-choice expense account. Nothing posts until the draft is confirmed. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the vendor from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), the cash or bank account from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts) or the credit card from [&#x60;GET /v1/credit-cards&#x60;](#tag/credit-card/GET/v1/credit-cards), the expense accounts from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), an item from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items), a warehouse from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses) and a tax rate from [&#x60;GET /v1/tax-rates&#x60;](#tag/tax-and-currencies/GET/v1/tax-rates). Attach the receipt with [&#x60;POST /v1/expenses/{id}/attachments&#x60;](#tag/expenses/POST/v1/expenses/{id}/attachments), fix the draft with [&#x60;PATCH /v1/expenses/{id}&#x60;](#tag/expenses/PATCH/v1/expenses/{id}) or drop it with [&#x60;POST /v1/expenses/{id}/cancel&#x60;](#tag/expenses/POST/v1/expenses/{id}/cancel), and post it with [&#x60;POST /v1/expenses/{id}/confirm&#x60;](#tag/expenses/POST/v1/expenses/{id}/confirm). A card charge is paid down later with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments).  Error codes: &#x60;payee_required&#x60;, &#x60;unknown_vendor&#x60;, &#x60;funding_source_required&#x60;, &#x60;funding_source_conflict&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;unknown_credit_card&#x60;, &#x60;credit_card_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;account_required&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;warehouse_archived&#x60;, &#x60;warehouse_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { CreateExpenseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // ExpenseInput
    expenseInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateExpenseRequest;

  try {
    const data = await api.createExpense(body);
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
| **expenseInput** | [ExpenseInput](ExpenseInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ExpenseResponse**](ExpenseResponse.md)

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


## deleteExpenseAttachment

> deleteExpenseAttachment(id, attachmentId)

Remove expense attachment

Removes one attached file from an expense that is still a draft, for example a photo of the wrong receipt. The file is deleted and no longer appears in &#x60;attachments&#x60;. Once the expense is posted its files are part of the record and cannot be removed. The call returns 204 with no body.  The &#x60;id&#x60; is the expense from [&#x60;GET /v1/expenses/{id}&#x60;](#tag/expenses/GET/v1/expenses/{id}) and the &#x60;attachment_id&#x60; is one of its &#x60;attachments&#x60;. Upload the right file with [&#x60;POST /v1/expenses/{id}/attachments&#x60;](#tag/expenses/POST/v1/expenses/{id}/attachments).  Error codes: &#x60;expense_not_draft&#x60;, &#x60;attachment_not_found&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { DeleteExpenseAttachmentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Attachment to remove, from the expense\'s `attachments`.
    attachmentId: attachmentId_example,
  } satisfies DeleteExpenseAttachmentRequest;

  try {
    const data = await api.deleteExpenseAttachment(body);
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
| **attachmentId** | `string` | Attachment to remove, from the expense\&#39;s &#x60;attachments&#x60;. | [Defaults to `undefined`] |

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


## getExpense

> ExpenseResponse getExpense(id)

Get expense

Returns one expense by its &#x60;id&#x60;, with the payee, date, cash or bank account, method, reference, status, every line with its account, quantity, prices and tax, the totals, the attached receipt files and the journal entry once posted. Use it to review a draft before posting, to prefill an edit form, or to show a receipt with its booking.  Take the &#x60;id&#x60; from [&#x60;GET /v1/expenses&#x60;](#tag/expenses/GET/v1/expenses) or from the response of [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses). While it is a draft, change it with [&#x60;PATCH /v1/expenses/{id}&#x60;](#tag/expenses/PATCH/v1/expenses/{id}) or drop it with [&#x60;POST /v1/expenses/{id}/cancel&#x60;](#tag/expenses/POST/v1/expenses/{id}/cancel); post it with [&#x60;POST /v1/expenses/{id}/confirm&#x60;](#tag/expenses/POST/v1/expenses/{id}/confirm), and reverse a posted one with [&#x60;POST /v1/expenses/{id}/void&#x60;](#tag/expenses/POST/v1/expenses/{id}/void). The booking is read with [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { GetExpenseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetExpenseRequest;

  try {
    const data = await api.getExpense(body);
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

[**ExpenseResponse**](ExpenseResponse.md)

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


## listExpenses

> ExpenseListResponse listExpenses(perPage, page, sort, createdAfter, createdBefore, status, vendorId, accountId, cashAccountId, creditCardId, dateFrom, dateTo)

List expenses

Lists the expenses you recorded, such as fuel, parking or meals paid straight from a cash or bank account, or charged to a credit card, with the payee, date, status and totals. Use it to review spending, to find drafts not yet posted, or to check what was paid from one account or card. Filter by &#x60;status&#x60;, &#x60;vendor_id&#x60;, &#x60;account_id&#x60;, &#x60;cash_account_id&#x60;, &#x60;credit_card_id&#x60; or expense date, and narrow by creation date.  Take a &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), an &#x60;account_id&#x60; from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), a &#x60;cash_account_id&#x60; from [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts), or a &#x60;credit_card_id&#x60; from [&#x60;GET /v1/credit-cards&#x60;](#tag/credit-card/GET/v1/credit-cards). New expenses are recorded with [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses), and one expense is read with [&#x60;GET /v1/expenses/{id}&#x60;](#tag/expenses/GET/v1/expenses/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { ListExpensesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

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
    // string | Filter by vendor. (optional)
    vendorId: vendorId_example,
    // string | Expenses with at least one line booked to this account. (optional)
    accountId: accountId_example,
    // string | Expenses paid from this cash or bank account. (optional)
    cashAccountId: cashAccountId_example,
    // string | Expenses charged to this credit card. (optional)
    creditCardId: creditCardId_example,
    // Date | Expense date on or after. (optional)
    dateFrom: 2013-10-20,
    // Date | Expense date on or before. (optional)
    dateTo: 2013-10-20,
  } satisfies ListExpensesRequest;

  try {
    const data = await api.listExpenses(body);
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
| **vendorId** | `string` | Filter by vendor. | [Optional] [Defaults to `undefined`] |
| **accountId** | `string` | Expenses with at least one line booked to this account. | [Optional] [Defaults to `undefined`] |
| **cashAccountId** | `string` | Expenses paid from this cash or bank account. | [Optional] [Defaults to `undefined`] |
| **creditCardId** | `string` | Expenses charged to this credit card. | [Optional] [Defaults to `undefined`] |
| **dateFrom** | `Date` | Expense date on or after. | [Optional] [Defaults to `undefined`] |
| **dateTo** | `Date` | Expense date on or before. | [Optional] [Defaults to `undefined`] |

### Return type

[**ExpenseListResponse**](ExpenseListResponse.md)

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


## postExpense

> ExpenseResponse postExpense(id, idempotencyKey)

Post expense to the GL

Posts a draft expense. It creates the journal entry, which debits each line\&#39;s account with the line subtotal and the input PPN account with the line tax, and credits &#x60;paid_via&#x60;\&#39;s cash account with the total, or its credit card\&#39;s liability account if it was charged instead. A line whose &#x60;item_id&#x60; is a stocked item also adds that quantity to &#x60;warehouse_id&#x60; at that moment, at &#x60;line_subtotal&#x60; divided by &#x60;quantity&#x60; as its unit cost. The status becomes &#x60;posted&#x60; and the expense is locked. The call fails with 422 if the period is closed, or if &#x60;paid_via.credit_card_id&#x60; is set and posting would put the card over its &#x60;credit_limit&#x60;. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create and fix the draft with [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses) and [&#x60;PATCH /v1/expenses/{id}&#x60;](#tag/expenses/PATCH/v1/expenses/{id}) first. After posting, the entry shows in [&#x60;GET /v1/gl/journal-entries/{id}&#x60;](#tag/journal/GET/v1/gl/journal-entries/{id}), and any stock received shows in [&#x60;GET /v1/inventory/movements&#x60;](#tag/inventory/GET/v1/inventory/movements), filtered by &#x60;item_id&#x60; and &#x60;warehouse_id&#x60;. A bank statement line for a cash payment can be matched to the expense with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match); a card charge is paid down later with [&#x60;POST /v1/credit-cards/payments&#x60;](#tag/credit-card-payment/POST/v1/credit-cards/payments). If it was posted by mistake, reverse it with [&#x60;POST /v1/expenses/{id}/void&#x60;](#tag/expenses/POST/v1/expenses/{id}/void).  Error codes: &#x60;expense_not_draft&#x60;, &#x60;period_closed&#x60;, &#x60;credit_limit_exceeded&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { PostExpenseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies PostExpenseRequest;

  try {
    const data = await api.postExpense(body);
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

[**ExpenseResponse**](ExpenseResponse.md)

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


## updateExpense

> ExpenseResponse updateExpense(id, expenseUpdate)

Update expense

Changes an expense that is still a draft. Send only the fields you want to change. When you send &#x60;lines&#x60;, the whole list replaces the old one, so include every line you want to keep, and the totals are worked out again. The same rules as on creation apply. Once the expense is posted, cancelled or void it can no longer be edited, and the call returns 409.  Read the current draft with [&#x60;GET /v1/expenses/{id}&#x60;](#tag/expenses/GET/v1/expenses/{id}) first. When it is right, post it with [&#x60;POST /v1/expenses/{id}/confirm&#x60;](#tag/expenses/POST/v1/expenses/{id}/confirm). To drop it, call [&#x60;POST /v1/expenses/{id}/cancel&#x60;](#tag/expenses/POST/v1/expenses/{id}/cancel).  Error codes: &#x60;expense_not_editable&#x60;, &#x60;payee_required&#x60;, &#x60;unknown_vendor&#x60;, &#x60;funding_source_required&#x60;, &#x60;funding_source_conflict&#x60;, &#x60;unknown_cash_account&#x60;, &#x60;unknown_credit_card&#x60;, &#x60;credit_card_archived&#x60;, &#x60;unknown_item&#x60;, &#x60;account_required&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;warehouse_archived&#x60;, &#x60;warehouse_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { UpdateExpenseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ExpenseUpdate
    expenseUpdate: ...,
  } satisfies UpdateExpenseRequest;

  try {
    const data = await api.updateExpense(body);
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
| **expenseUpdate** | [ExpenseUpdate](ExpenseUpdate.md) |  | |

### Return type

[**ExpenseResponse**](ExpenseResponse.md)

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


## uploadExpenseAttachments

> ExpenseResponse uploadExpenseAttachments(id, kind, files, idempotencyKey)

Upload expense files

Attaches files to an expense, each labelled with its &#x60;kind&#x60;: the store\&#39;s &#x60;receipt&#x60; showing what was bought, the &#x60;payment_proof&#x60; that the money actually left the account (a bank transfer slip, a screenshot), or &#x60;other&#x60;. Send one or more files of the same &#x60;kind&#x60; in a single call; each one is added to the expense\&#39;s &#x60;attachments&#x60; and nothing is replaced. Upload the receipt and the payment proof as two separate calls, one per &#x60;kind&#x60;. Files can be added while the expense is a draft or posted, but not once it is cancelled or void. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Create the expense first with [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses). The files are read back with [&#x60;GET /v1/expenses/{id}&#x60;](#tag/expenses/GET/v1/expenses/{id}) as &#x60;attachments&#x60;, each with its &#x60;kind&#x60; and a short-lived &#x60;download_url&#x60;. While the expense is a draft, a wrong file is removed with [&#x60;DELETE /v1/expenses/{id}/attachments/{attachment_id}&#x60;](#tag/expenses/DELETE/v1/expenses/{id}/attachments/{attachment_id}).  Error codes: &#x60;expense_closed&#x60;, &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { UploadExpenseAttachmentsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: 'id_example',
    // string | Applies to every file in this call.
    kind: 'kind_example',
    // Array<Blob> | PDF, JPEG or PNG, up to 10 MB each.
    files: [new Blob(['example file content'], { type: 'application/octet-stream' })],
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: 'idempotencyKey_example',
  } satisfies UploadExpenseAttachmentsRequest;

  try {
    const data = await api.uploadExpenseAttachments(body);
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
| **kind** | `receipt`, `payment_proof`, `other` | Applies to every file in this call. | [Defaults to `undefined`] [Enum: receipt, payment_proof, other] |
| **files** | `Array<Blob>` | PDF, JPEG or PNG, up to 10 MB each. | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ExpenseResponse**](ExpenseResponse.md)

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


## voidExpense

> ExpenseResponse voidExpense(id, idempotencyKey)

Void expense

Voids a posted expense by reversing its journal entry. Any stock a stocked line received is reversed too, taken back out of &#x60;warehouse_id&#x60; at the same unit cost it came in at. The status becomes &#x60;void&#x60; and the spending no longer counts in the expense accounts or the cash, bank or credit card balance. Use it when an expense was posted by mistake, with the wrong amount, account or funding source, or twice. The expense and its attachments stay on record. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Read the expense first with [&#x60;GET /v1/expenses/{id}&#x60;](#tag/expenses/GET/v1/expenses/{id}). If a bank statement line was matched to it, the line goes back to unmatched, and you match it again with [&#x60;POST /v1/bank/statement-lines/{id}/match&#x60;](#tag/statements/POST/v1/bank/statement-lines/{id}/match). After voiding, record the right expense with [&#x60;POST /v1/expenses&#x60;](#tag/expenses/POST/v1/expenses).  Error codes: &#x60;expense_not_voidable&#x60;, &#x60;reconciliation_locked&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ExpensesApi,
} from '@zerpto/sdk';
import type { VoidExpenseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ExpensesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies VoidExpenseRequest;

  try {
    const data = await api.voidExpense(body);
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

[**ExpenseResponse**](ExpenseResponse.md)

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

