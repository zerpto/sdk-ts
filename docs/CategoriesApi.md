# CategoriesApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createAssetCategory**](CategoriesApi.md#createassetcategory) | **POST** /v1/assets/categories | Create asset category |
| [**getAssetCategory**](CategoriesApi.md#getassetcategory) | **GET** /v1/assets/categories/{id} | Get asset category |
| [**listAssetCategories**](CategoriesApi.md#listassetcategories) | **GET** /v1/assets/categories | List asset categories |
| [**updateAssetCategory**](CategoriesApi.md#updateassetcategory) | **PATCH** /v1/assets/categories/{id} | Update asset category |



## createAssetCategory

> AssetCategoryResponse createAssetCategory(assetCategoryInput, idempotencyKey)

Create asset category

Creates an asset category, a template for a kind of asset such as vehicles or computers. Send the &#x60;name&#x60;, the &#x60;depreciation_method&#x60; (&#x60;straight_line&#x60; or &#x60;declining_balance&#x60;), the &#x60;useful_life_months&#x60;, and the three ledger accounts: the one that holds the cost, the one that collects accumulated depreciation, and the expense account that depreciation is charged to. For &#x60;declining_balance&#x60; also send the annual &#x60;declining_rate&#x60;, such as &#x60;0.25&#x60;. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the three account ids from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). Change the category later with [&#x60;PATCH /v1/assets/categories/{id}&#x60;](#tag/categories/PATCH/v1/assets/categories/{id}). Register assets in it with [&#x60;POST /v1/assets&#x60;](#tag/fixed-assets/POST/v1/assets), or straight from a vendor bill line with [&#x60;POST /v1/assets/from-bill&#x60;](#tag/fixed-assets/POST/v1/assets/from-bill).  Error codes: &#x60;unknown_account&#x60;, &#x60;account_type_mismatch&#x60;, &#x60;declining_rate_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CategoriesApi,
} from '@zerpto/sdk';
import type { CreateAssetCategoryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CategoriesApi(config);

  const body = {
    // AssetCategoryInput
    assetCategoryInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateAssetCategoryRequest;

  try {
    const data = await api.createAssetCategory(body);
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
| **assetCategoryInput** | [AssetCategoryInput](AssetCategoryInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**AssetCategoryResponse**](AssetCategoryResponse.md)

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


## getAssetCategory

> AssetCategoryResponse getAssetCategory(id)

Get asset category

Returns one asset category by its &#x60;id&#x60;, with its name, depreciation method, useful life, declining rate and ledger accounts. Use it to show the category, to prefill an edit form, or to see which defaults a new asset will get.  Take the &#x60;id&#x60; from [&#x60;GET /v1/assets/categories&#x60;](#tag/categories/GET/v1/assets/categories) or from the response of [&#x60;POST /v1/assets/categories&#x60;](#tag/categories/POST/v1/assets/categories). Change it with [&#x60;PATCH /v1/assets/categories/{id}&#x60;](#tag/categories/PATCH/v1/assets/categories/{id}). Assets are registered in a category with [&#x60;POST /v1/assets&#x60;](#tag/fixed-assets/POST/v1/assets).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CategoriesApi,
} from '@zerpto/sdk';
import type { GetAssetCategoryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CategoriesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetAssetCategoryRequest;

  try {
    const data = await api.getAssetCategory(body);
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

[**AssetCategoryResponse**](AssetCategoryResponse.md)

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


## listAssetCategories

> AssetCategoryListResponse listAssetCategories(perPage, page, status)

List asset categories

Lists the asset categories you have defined, each with its depreciation method, useful life and the three ledger accounts it uses. Use it to fill a category picker when you register an asset, or to show the categories page. Filter with &#x60;status&#x60; to see only the active ones, or only the archived ones.  New categories are made with [&#x60;POST /v1/assets/categories&#x60;](#tag/categories/POST/v1/assets/categories) and one is read with [&#x60;GET /v1/assets/categories/{id}&#x60;](#tag/categories/GET/v1/assets/categories/{id}). The &#x60;id&#x60; of a category is the &#x60;category_id&#x60; when you register an asset with [&#x60;POST /v1/assets&#x60;](#tag/fixed-assets/POST/v1/assets) or [&#x60;POST /v1/assets/from-bill&#x60;](#tag/fixed-assets/POST/v1/assets/from-bill), and the asset then follows the category\&#39;s method and accounts when depreciation is run with [&#x60;POST /v1/assets/depreciation-runs&#x60;](#tag/depreciation/POST/v1/assets/depreciation-runs).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CategoriesApi,
} from '@zerpto/sdk';
import type { ListAssetCategoriesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CategoriesApi(config);

  const body = {
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
    // 'active' | 'archived' | Filter by status. (optional)
    status: status_example,
  } satisfies ListAssetCategoriesRequest;

  try {
    const data = await api.listAssetCategories(body);
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

[**AssetCategoryListResponse**](AssetCategoryListResponse.md)

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


## updateAssetCategory

> AssetCategoryResponse updateAssetCategory(id, assetCategoryUpdate)

Update asset category

Changes an asset category. Send only the fields you want to change. The method, the life and the accounts apply to assets registered afterwards; assets that already exist keep their own values, so past depreciation does not change. Set the &#x60;status&#x60; to &#x60;archived&#x60; when you stop using the category, and back to &#x60;active&#x60; to use it again.  Read the current category with [&#x60;GET /v1/assets/categories/{id}&#x60;](#tag/categories/GET/v1/assets/categories/{id}) first, and take new account ids from [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). An archived category can no longer be chosen for new assets with [&#x60;POST /v1/assets&#x60;](#tag/fixed-assets/POST/v1/assets), but the assets already in it keep depreciating.  Error codes: &#x60;unknown_account&#x60;, &#x60;account_type_mismatch&#x60;, &#x60;declining_rate_required&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CategoriesApi,
} from '@zerpto/sdk';
import type { UpdateAssetCategoryRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CategoriesApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // AssetCategoryUpdate
    assetCategoryUpdate: ...,
  } satisfies UpdateAssetCategoryRequest;

  try {
    const data = await api.updateAssetCategory(body);
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
| **assetCategoryUpdate** | [AssetCategoryUpdate](AssetCategoryUpdate.md) |  | |

### Return type

[**AssetCategoryResponse**](AssetCategoryResponse.md)

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

