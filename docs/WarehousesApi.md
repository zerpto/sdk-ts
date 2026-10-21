# WarehousesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**archiveWarehouse**](WarehousesApi.md#archivewarehouse) | **DELETE** /v1/inventory/warehouses/{id} | Archive a warehouse |
| [**createWarehouse**](WarehousesApi.md#createwarehouse) | **POST** /v1/inventory/warehouses | Create a warehouse |
| [**getWarehouse**](WarehousesApi.md#getwarehouse) | **GET** /v1/inventory/warehouses/{id} | Get a warehouse |
| [**listWarehouses**](WarehousesApi.md#listwarehouses) | **GET** /v1/inventory/warehouses | List warehouses |
| [**updateWarehouse**](WarehousesApi.md#updatewarehouse) | **PATCH** /v1/inventory/warehouses/{id} | Update a warehouse |



## archiveWarehouse

> archiveWarehouse(id)

Archive a warehouse

Archives a warehouse, so it no longer shows up when you pick a warehouse for a new document. Warehouses are archived and not deleted, because the stock movements recorded in them have to keep their history. Use it for a warehouse you have closed.  Find the id with [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). A warehouse cannot be archived while stock remains in it, so move the stock out first with [&#x60;POST /v1/inventory/transfers&#x60;](#tag/transfers/POST/v1/inventory/transfers) or write it off with [&#x60;POST /v1/inventory/adjustments&#x60;](#tag/adjustments/POST/v1/inventory/adjustments). An archived warehouse can still be read with [&#x60;GET /v1/inventory/warehouses/{id}&#x60;](#tag/warehouses/GET/v1/inventory/warehouses/{id}).  Error codes: &#x60;warehouse_not_empty&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  WarehousesApi,
} from '@zerpto/sdk';
import type { ArchiveWarehouseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WarehousesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies ArchiveWarehouseRequest;

  try {
    const data = await api.archiveWarehouse(body);
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


## createWarehouse

> WarehouseResponse createWarehouse(warehouseInput, idempotencyKey)

Create a warehouse

Adds a warehouse, a place where you keep stock. Give it a &#x60;code&#x60; of your own that is unique in the tenant, a name and, if you like, an address. The address is picked from the region hierarchy, down to the sub-district where the country has region data, or typed by hand for a country without data. A new warehouse starts empty and active.  Take the regions for the address from [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions). Once the warehouse exists, you can set it as the default warehouse of an item with [&#x60;PATCH /v1/items/{id}&#x60;](#tag/product-items/PATCH/v1/items/{id}), and stock arrives in it through goods receipts, adjustments and [&#x60;POST /v1/inventory/transfers&#x60;](#tag/transfers/POST/v1/inventory/transfers). Send an &#x60;Idempotency-Key&#x60; header so a retry does not create it twice.  Error codes: &#x60;code_taken&#x60;, &#x60;unknown_region&#x60;, &#x60;region_required&#x60;, &#x60;region_too_shallow&#x60;, &#x60;country_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  WarehousesApi,
} from '@zerpto/sdk';
import type { CreateWarehouseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WarehousesApi(config);

  const body = {
    // WarehouseInput
    warehouseInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateWarehouseRequest;

  try {
    const data = await api.createWarehouse(body);
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
| **warehouseInput** | [WarehouseInput](WarehouseInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**WarehouseResponse**](WarehouseResponse.md)

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


## getWarehouse

> WarehouseResponse getWarehouse(id)

Get a warehouse

Returns one warehouse by id: its code, name, address and status. Use it to open the detail page of a warehouse, or to check that a warehouse is still active before you use it on a document.  The id comes from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses) or from the &#x60;default_warehouse_id&#x60; of an item. What it holds is shown by [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock). To change it, call [&#x60;PATCH /v1/inventory/warehouses/{id}&#x60;](#tag/warehouses/PATCH/v1/inventory/warehouses/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  WarehousesApi,
} from '@zerpto/sdk';
import type { GetWarehouseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WarehousesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetWarehouseRequest;

  try {
    const data = await api.getWarehouse(body);
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

[**WarehouseResponse**](WarehouseResponse.md)

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


## listWarehouses

> WarehouseListResponse listWarehouses(perPage, page, status)

List warehouses

Lists the warehouses of your tenant, the places where you keep stock, with their code, name, address and status. Use it to fill a warehouse picker on receipts, deliveries, adjustments and transfers, or to show the warehouse page. Filter with &#x60;status&#x60; to see only the active ones, or only the archived ones.  One warehouse is returned by [&#x60;GET /v1/inventory/warehouses/{id}&#x60;](#tag/warehouses/GET/v1/inventory/warehouses/{id}), and new ones are added with [&#x60;POST /v1/inventory/warehouses&#x60;](#tag/warehouses/POST/v1/inventory/warehouses). To see what each one holds, call [&#x60;GET /v1/inventory/stock&#x60;](#tag/inventory/GET/v1/inventory/stock), and to move stock from one to another, use [&#x60;POST /v1/inventory/transfers&#x60;](#tag/transfers/POST/v1/inventory/transfers).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  WarehousesApi,
} from '@zerpto/sdk';
import type { ListWarehousesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WarehousesApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // 'active' | 'archived' | Filter by status. (optional)
    status: status_example,
  } satisfies ListWarehousesRequest;

  try {
    const data = await api.listWarehouses(body);
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
| **status** | `active`, `archived` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: active, archived] |

### Return type

[**WarehouseListResponse**](WarehouseListResponse.md)

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


## updateWarehouse

> WarehouseResponse updateWarehouse(id, warehouseUpdate)

Update a warehouse

Changes the name or the address of a warehouse. Send only the fields you want to change. The &#x60;code&#x60; cannot be changed once the warehouse exists, because stock movements and documents refer to it. Use it when a warehouse is renamed or moves.  For a new address, pick the regions with [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions), the same way as in [&#x60;POST /v1/inventory/warehouses&#x60;](#tag/warehouses/POST/v1/inventory/warehouses). Stock and movements already recorded stay with the warehouse, whatever its address. To stop using a warehouse, call [&#x60;DELETE /v1/inventory/warehouses/{id}&#x60;](#tag/warehouses/DELETE/v1/inventory/warehouses/{id}).  Error codes: &#x60;unknown_region&#x60;, &#x60;region_required&#x60;, &#x60;region_too_shallow&#x60;, &#x60;country_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  WarehousesApi,
} from '@zerpto/sdk';
import type { UpdateWarehouseRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new WarehousesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // WarehouseUpdate
    warehouseUpdate: ...,
  } satisfies UpdateWarehouseRequest;

  try {
    const data = await api.updateWarehouse(body);
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
| **warehouseUpdate** | [WarehouseUpdate](WarehouseUpdate.md) |  | |

### Return type

[**WarehouseResponse**](WarehouseResponse.md)

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

