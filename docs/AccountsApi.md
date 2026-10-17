# AccountsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**archiveAccount**](AccountsApi.md#archiveaccount) | **DELETE** /v1/accounts/{id} | Archive an account |
| [**createAccount**](AccountsApi.md#createaccount) | **POST** /v1/accounts | Create account |
| [**getAccount**](AccountsApi.md#getaccount) | **GET** /v1/accounts/{id} | Get an account |
| [**listAccounts**](AccountsApi.md#listaccounts) | **GET** /v1/accounts | List accounts |
| [**updateAccount**](AccountsApi.md#updateaccount) | **PATCH** /v1/accounts/{id} | Update an account |



## archiveAccount

> archiveAccount(id)

Archive an account

Archives an account, so it no longer shows up when you pick an account for a new entry. Accounts are archived and not deleted, because the entries already posted to them still refer to them and the books need a reliable history. Use it for an account you no longer use.  Find the id with [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). An archived account can still be read with [&#x60;GET /v1/accounts/{id}&#x60;](#tag/accounts/GET/v1/accounts/{id}) and listed with the other accounts. It cannot be archived while its balance is not zero, or while it still has active accounts below it, so move or archive those first.  Error codes: &#x60;account_has_balance&#x60;, &#x60;account_has_children&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  AccountsApi,
} from '@zerpto/sdk';
import type { ArchiveAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AccountsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies ArchiveAccountRequest;

  try {
    const data = await api.archiveAccount(body);
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


## createAccount

> AccountResponse createAccount(accountInput, idempotencyKey)

Create account

Adds an account to the chart of accounts. Give it a &#x60;code&#x60; that is unique in your tenant, a name and a &#x60;type&#x60;: asset, liability, equity, revenue or expense. The normal balance follows from the type, debit for assets and expenses and credit for the rest. Set &#x60;is_postable&#x60; to false for a header that only groups other accounts, and place an account under it with &#x60;parent_id&#x60;.  Take the parent from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). It has to be a header account of the same type. Once created, the account can be picked on the lines of [&#x60;POST /v1/gl/journal-entries&#x60;](#tag/journal/POST/v1/gl/journal-entries) and on items with [&#x60;POST /v1/items&#x60;](#tag/product-items/POST/v1/items), and renamed or moved later with [&#x60;PATCH /v1/accounts/{id}&#x60;](#tag/accounts/PATCH/v1/accounts/{id}). Send an &#x60;Idempotency-Key&#x60; header so a retry does not create it twice.  Error codes: &#x60;code_taken&#x60;, &#x60;unknown_parent&#x60;, &#x60;parent_type_mismatch&#x60;, &#x60;parent_not_group&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AccountsApi,
} from '@zerpto/sdk';
import type { CreateAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AccountsApi(config);

  const body = {
    // AccountInput
    accountInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateAccountRequest;

  try {
    const data = await api.createAccount(body);
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
| **accountInput** | [AccountInput](AccountInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**AccountResponse**](AccountResponse.md)

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


## getAccount

> AccountResponse getAccount(id)

Get an account

Returns one account by id: its code, name, type, normal balance, parent, whether it accepts postings and its status. Use it to open an account\&#39;s detail page, or to check that an account is still active before you use it.  The id comes from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts) or from the &#x60;account_id&#x60; of a journal line. To change the account, call [&#x60;PATCH /v1/accounts/{id}&#x60;](#tag/accounts/PATCH/v1/accounts/{id}), and to stop using it, call [&#x60;DELETE /v1/accounts/{id}&#x60;](#tag/accounts/DELETE/v1/accounts/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AccountsApi,
} from '@zerpto/sdk';
import type { GetAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AccountsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetAccountRequest;

  try {
    const data = await api.getAccount(body);
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

[**AccountResponse**](AccountResponse.md)

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


## listAccounts

> AccountListResponse listAccounts(perPage, page, sort, createdAfter, createdBefore, type)

List accounts

Lists the accounts of your chart of accounts, each with its code, name, type, normal balance, whether it accepts postings and its status. Use it to fill an account picker on journal entries, invoices and items, or to show the whole chart as a table. Filter by &#x60;type&#x60;, and sort or narrow by creation date.  One account is returned by [&#x60;GET /v1/accounts/{id}&#x60;](#tag/accounts/GET/v1/accounts/{id}), and new ones are added with [&#x60;POST /v1/accounts&#x60;](#tag/accounts/POST/v1/accounts). The &#x60;id&#x60; of an account is what you send as &#x60;account_id&#x60; on the lines of [&#x60;POST /v1/gl/journal-entries&#x60;](#tag/journal/POST/v1/gl/journal-entries) and as the sales or purchase account of an item in [&#x60;POST /v1/items&#x60;](#tag/product-items/POST/v1/items).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  AccountsApi,
} from '@zerpto/sdk';
import type { ListAccountsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AccountsApi(config);

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
    // 'asset' | 'liability' | 'equity' | 'revenue' | 'expense' | Filter by account type. (optional)
    type: type_example,
  } satisfies ListAccountsRequest;

  try {
    const data = await api.listAccounts(body);
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
| **type** | `asset`, `liability`, `equity`, `revenue`, `expense` | Filter by account type. | [Optional] [Defaults to `undefined`] [Enum: asset, liability, equity, revenue, expense] |

### Return type

[**AccountListResponse**](AccountListResponse.md)

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


## updateAccount

> AccountResponse updateAccount(id, accountUpdate)

Update an account

Changes an account. Send only the fields you want to change: the name, the parent, or &#x60;is_postable&#x60;. The &#x60;code&#x60; and the &#x60;type&#x60; cannot be changed, because posted entries rely on them. To fix a wrong code or type, archive the account and create a new one.  A new parent comes from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), with the same rules as in [&#x60;POST /v1/accounts&#x60;](#tag/accounts/POST/v1/accounts). An account that has entries posted to it cannot become a header. Entries already posted keep pointing to the account, and the change shows in the reports straight away.  Error codes: &#x60;unknown_parent&#x60;, &#x60;parent_type_mismatch&#x60;, &#x60;parent_not_group&#x60;, &#x60;account_has_postings&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AccountsApi,
} from '@zerpto/sdk';
import type { UpdateAccountRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AccountsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // AccountUpdate
    accountUpdate: ...,
  } satisfies UpdateAccountRequest;

  try {
    const data = await api.updateAccount(body);
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
| **accountUpdate** | [AccountUpdate](AccountUpdate.md) |  | |

### Return type

[**AccountResponse**](AccountResponse.md)

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

