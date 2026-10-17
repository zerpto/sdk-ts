# ProductItemsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**archiveItem**](ProductItemsApi.md#archiveitem) | **DELETE** /v1/items/{id} | Archive an item |
| [**createItem**](ProductItemsApi.md#createitem) | **POST** /v1/items | Create item |
| [**getItem**](ProductItemsApi.md#getitem) | **GET** /v1/items/{id} | Get an item |
| [**listItems**](ProductItemsApi.md#listitems) | **GET** /v1/items | List items |
| [**updateItem**](ProductItemsApi.md#updateitem) | **PATCH** /v1/items/{id} | Update an item |



## archiveItem

> archiveItem(id)

Archive an item

Archives an item, so it no longer shows up when you pick an item for a new document. Items are archived and not deleted, because documents that used the item keep pointing to it and keep working. Use it when you stop selling or buying something.  Find the id with [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items). An archived item can still be read with [&#x60;GET /v1/items/{id}&#x60;](#tag/product-items/GET/v1/items/{id}), and listed with &#x60;status&#x3D;archived&#x60;. A stocked item cannot be archived while stock remains: move it out first with a stock adjustment or a transfer.  Error codes: &#x60;item_has_stock&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  ProductItemsApi,
} from '@zerpto/sdk';
import type { ArchiveItemRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ProductItemsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies ArchiveItemRequest;

  try {
    const data = await api.archiveItem(body);
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


## createItem

> ItemResponse createItem(itemInput, idempotencyKey)

Create item

Adds a product or a service to your catalogue. &#x60;sku&#x60; is your own code and must be unique in the tenant. &#x60;type&#x60; says whether the item is &#x60;goods&#x60; or a &#x60;service&#x60;, and only goods can be stocked. &#x60;unit&#x60; is the base unit: quantities on documents and in stock are counted in it. Add &#x60;units&#x60; when you also buy or sell the item in larger packs, such as a box of 12.  Take the account ids from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), the tax rate from [&#x60;GET /v1/tax-rates&#x60;](#tag/tax-and-currencies/GET/v1/tax-rates) and the default warehouse from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/inventory/GET/v1/inventory/warehouses). The new item can be used on documents straight away, and changed later with [&#x60;PATCH /v1/items/{id}&#x60;](#tag/product-items/PATCH/v1/items/{id}). Send an &#x60;Idempotency-Key&#x60; header so a retry does not create it twice.  Error codes: &#x60;sku_taken&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;invalid_units&#x60;, &#x60;stock_requires_goods&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ProductItemsApi,
} from '@zerpto/sdk';
import type { CreateItemRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ProductItemsApi(config);

  const body = {
    // ItemInput
    itemInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateItemRequest;

  try {
    const data = await api.createItem(body);
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
| **itemInput** | [ItemInput](ItemInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ItemResponse**](ItemResponse.md)

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


## getItem

> ItemResponse getItem(id)

Get an item

Returns one item by id, with its prices, base unit, the alternative units and their conversion factors, and the accounts and tax rate it posts to. Use it to open an item\&#39;s detail page, or to read the price and unit before you build a document line.  The id comes from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) or from the &#x60;item_id&#x60; of a document line. To change the item, call [&#x60;PATCH /v1/items/{id}&#x60;](#tag/product-items/PATCH/v1/items/{id}), and to stop using it, call [&#x60;DELETE /v1/items/{id}&#x60;](#tag/product-items/DELETE/v1/items/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ProductItemsApi,
} from '@zerpto/sdk';
import type { GetItemRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ProductItemsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetItemRequest;

  try {
    const data = await api.getItem(body);
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

[**ItemResponse**](ItemResponse.md)

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


## listItems

> ItemListResponse listItems(perPage, page, sort, createdAfter, createdBefore, status, type, isStocked, q)

List items

Lists the goods and services you buy and sell, with their prices, base unit, tax rate and whether stock is tracked. Use it to fill an item picker on invoices and bills, or to browse the catalogue. Filter by &#x60;status&#x60;, &#x60;type&#x60; or &#x60;is_stocked&#x60;, search by SKU or name with &#x60;q&#x60;, and narrow by creation date.  One item, with its units, is returned by [&#x60;GET /v1/items/{id}&#x60;](#tag/product-items/GET/v1/items/{id}), and new ones are added with [&#x60;POST /v1/items&#x60;](#tag/product-items/POST/v1/items). The &#x60;id&#x60; of an item is the &#x60;item_id&#x60; on the lines of [&#x60;POST /v1/ar/invoices&#x60;](#tag/accounts-receivable/POST/v1/ar/invoices) and [&#x60;POST /v1/ap/invoices&#x60;](#tag/accounts-payable/POST/v1/ap/invoices).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  ProductItemsApi,
} from '@zerpto/sdk';
import type { ListItemsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ProductItemsApi(config);

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
    // 'active' | 'archived' | Filter by status. (optional)
    status: status_example,
    // 'goods' | 'service' | Only goods or only services. (optional)
    type: type_example,
    // boolean | Only items whose stock is tracked (`true`) or not (`false`). (optional)
    isStocked: true,
    // string | Search by SKU or name. (optional)
    q: q_example,
  } satisfies ListItemsRequest;

  try {
    const data = await api.listItems(body);
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
| **status** | `active`, `archived` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: active, archived] |
| **type** | `goods`, `service` | Only goods or only services. | [Optional] [Defaults to `undefined`] [Enum: goods, service] |
| **isStocked** | `boolean` | Only items whose stock is tracked (&#x60;true&#x60;) or not (&#x60;false&#x60;). | [Optional] [Defaults to `undefined`] |
| **q** | `string` | Search by SKU or name. | [Optional] [Defaults to `undefined`] |

### Return type

[**ItemListResponse**](ItemListResponse.md)

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


## updateItem

> ItemResponse updateItem(id, itemUpdate)

Update an item

Changes an item. Send only the fields you want to change. &#x60;units&#x60;, when sent, replaces the whole list of alternative units, so send every unit you want to keep, or an empty list to remove them all. Use it to fix a name, move a price or add a pack size. A new price applies to documents created afterwards, and posted documents keep theirs.  Account, tax rate and warehouse ids come from the same lists as in [&#x60;POST /v1/items&#x60;](#tag/product-items/POST/v1/items). The base &#x60;unit&#x60; cannot change once the item has stock or has been used on a posted document, because quantities are counted in it. Read the result back with [&#x60;GET /v1/items/{id}&#x60;](#tag/product-items/GET/v1/items/{id}).  Error codes: &#x60;sku_taken&#x60;, &#x60;unknown_account&#x60;, &#x60;unknown_tax_rate&#x60;, &#x60;unknown_warehouse&#x60;, &#x60;invalid_units&#x60;, &#x60;stock_requires_goods&#x60;, &#x60;unit_locked&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ProductItemsApi,
} from '@zerpto/sdk';
import type { UpdateItemRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ProductItemsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // ItemUpdate
    itemUpdate: ...,
  } satisfies UpdateItemRequest;

  try {
    const data = await api.updateItem(body);
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
| **itemUpdate** | [ItemUpdate](ItemUpdate.md) |  | |

### Return type

[**ItemResponse**](ItemResponse.md)

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

