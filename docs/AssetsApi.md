# AssetsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createAsset**](AssetsApi.md#createasset) | **POST** /v1/assets | Register an asset |
| [**createAssetFromBill**](AssetsApi.md#createassetfrombill) | **POST** /v1/assets/from-bill | Register asset from a bill |
| [**disposeAsset**](AssetsApi.md#disposeasset) | **POST** /v1/assets/{id}/dispose | Dispose or sell an asset |
| [**getAsset**](AssetsApi.md#getasset) | **GET** /v1/assets/{id} | Get asset |
| [**listAssets**](AssetsApi.md#listassets) | **GET** /v1/assets | List assets |
| [**updateAsset**](AssetsApi.md#updateasset) | **PATCH** /v1/assets/{id} | Update asset |



## createAsset

> AssetResponse createAsset(assetInput, idempotencyKey)

Register an asset

Registers an asset by hand. Use it for assets you bought before you started using the system, or acquired outside Accounts Payable. Send the &#x60;name&#x60;, the &#x60;category_id&#x60;, the &#x60;acquisition_date&#x60; and the &#x60;acquisition_cost&#x60;. The life, the method and the rate default from the category, and depreciation starts in the acquisition month unless you send a &#x60;depreciation_start_date&#x60;. No journal entry is posted, so for a migrated asset send the &#x60;opening_accumulated_depreciation&#x60;. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the &#x60;category_id&#x60; from [&#x60;GET /v1/assets/categories&#x60;](#tag/categories/GET/v1/assets/categories). For assets you buy through a vendor bill, use [&#x60;POST /v1/assets/from-bill&#x60;](#tag/assets/POST/v1/assets/from-bill) instead, which books nothing twice. Once the asset exists, depreciation is posted for it by [&#x60;POST /v1/assets/depreciation-runs&#x60;](#tag/depreciation/POST/v1/assets/depreciation-runs), and you can change some fields with [&#x60;PATCH /v1/assets/{id}&#x60;](#tag/assets/PATCH/v1/assets/{id}).  Error codes: &#x60;unknown_category&#x60;, &#x60;category_archived&#x60;, &#x60;duplicate_code&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AssetsApi,
} from '@zerpto/sdk';
import type { CreateAssetRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AssetsApi(config);

  const body = {
    // AssetInput
    assetInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateAssetRequest;

  try {
    const data = await api.createAsset(body);
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
| **assetInput** | [AssetInput](AssetInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**AssetResponse**](AssetResponse.md)

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


## createAssetFromBill

> AssetResponse createAssetFromBill(assetFromBillInput, idempotencyKey)

Register asset from a bill

Registers an asset from a line on a posted vendor bill, so the purchase and the asset stay linked. Send the &#x60;ap_invoice_id&#x60;, the &#x60;line_id&#x60; and the &#x60;category_id&#x60;; the &#x60;name&#x60; defaults to the line description, the cost comes from the line subtotal and the start of depreciation defaults to the bill month. The line must be posted to the asset account of the category, and each line can be registered once. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Post the bill first with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm) and read its lines with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}). Take the &#x60;category_id&#x60; from [&#x60;GET /v1/assets/categories&#x60;](#tag/categories/GET/v1/assets/categories). The new asset is then depreciated by [&#x60;POST /v1/assets/depreciation-runs&#x60;](#tag/depreciation/POST/v1/assets/depreciation-runs). For assets that do not come from a bill, use [&#x60;POST /v1/assets&#x60;](#tag/assets/POST/v1/assets).  Error codes: &#x60;bill_not_posted&#x60;, &#x60;account_mismatch&#x60;, &#x60;line_already_registered&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AssetsApi,
} from '@zerpto/sdk';
import type { CreateAssetFromBillRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AssetsApi(config);

  const body = {
    // AssetFromBillInput
    assetFromBillInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateAssetFromBillRequest;

  try {
    const data = await api.createAssetFromBill(body);
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
| **assetFromBillInput** | [AssetFromBillInput](AssetFromBillInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**AssetResponse**](AssetResponse.md)

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


## disposeAsset

> AssetResponse disposeAsset(id, assetDisposeInput, idempotencyKey)

Dispose or sell an asset

Disposes of an asset, either as a &#x60;sale&#x60; or as a &#x60;scrap&#x60;. Send the &#x60;disposal_date&#x60; and the &#x60;type&#x60;; for a sale also send the &#x60;proceeds&#x60; and the &#x60;proceeds_account_id&#x60; that receives the money. The disposal removes the cost and the accumulated depreciation from the books and posts the gain or loss, which is the proceeds minus the net book value. The asset becomes &#x60;disposed&#x60; and its &#x60;disposal&#x60; is filled in. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Depreciation must be run up to the month before the disposal with [&#x60;POST /v1/assets/depreciation-runs&#x60;](#tag/depreciation/POST/v1/assets/depreciation-runs). Take the &#x60;proceeds_account_id&#x60; from the chart of accounts, [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts), and read the asset with [&#x60;GET /v1/assets/{id}&#x60;](#tag/assets/GET/v1/assets/{id}). A disposed asset cannot be changed with [&#x60;PATCH /v1/assets/{id}&#x60;](#tag/assets/PATCH/v1/assets/{id}). The call fails with 422 if the period is closed.  Error codes: &#x60;depreciation_pending&#x60;, &#x60;already_disposed&#x60;, &#x60;proceeds_required&#x60;, &#x60;period_closed&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AssetsApi,
} from '@zerpto/sdk';
import type { DisposeAssetRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AssetsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // AssetDisposeInput
    assetDisposeInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies DisposeAssetRequest;

  try {
    const data = await api.disposeAsset(body);
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
| **assetDisposeInput** | [AssetDisposeInput](AssetDisposeInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**AssetResponse**](AssetResponse.md)

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


## getAsset

> AssetResponse getAsset(id)

Get asset

Returns one asset by its &#x60;id&#x60;, with its category, cost, salvage value, life, depreciation method, accumulated depreciation, net book value and, when it was disposed of, the disposal. Use it to show the asset, to prefill an edit form, or to check its book value.  Take the &#x60;id&#x60; from [&#x60;GET /v1/assets&#x60;](#tag/assets/GET/v1/assets) or from the response of [&#x60;POST /v1/assets&#x60;](#tag/assets/POST/v1/assets). The schedule of depreciation posted and still to come is in [&#x60;GET /v1/assets/{id}/schedule&#x60;](#tag/depreciation/GET/v1/assets/{id}/schedule). Change the asset with [&#x60;PATCH /v1/assets/{id}&#x60;](#tag/assets/PATCH/v1/assets/{id}), or remove it from the register with [&#x60;POST /v1/assets/{id}/dispose&#x60;](#tag/assets/POST/v1/assets/{id}/dispose).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AssetsApi,
} from '@zerpto/sdk';
import type { GetAssetRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AssetsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetAssetRequest;

  try {
    const data = await api.getAsset(body);
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

[**AssetResponse**](AssetResponse.md)

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


## listAssets

> AssetListResponse listAssets(perPage, page, sort, createdAfter, createdBefore, categoryId, status)

List assets

Lists the assets in your register, with the category, acquisition date and cost, accumulated depreciation, net book value and status. Use it to show the asset register, to find assets that are fully depreciated, or to review what was disposed of. Filter by &#x60;category_id&#x60; or &#x60;status&#x60; and narrow by creation date.  Get a &#x60;category_id&#x60; for the filter from [&#x60;GET /v1/assets/categories&#x60;](#tag/categories/GET/v1/assets/categories). New assets are registered with [&#x60;POST /v1/assets&#x60;](#tag/assets/POST/v1/assets) or [&#x60;POST /v1/assets/from-bill&#x60;](#tag/assets/POST/v1/assets/from-bill), and one asset is read with [&#x60;GET /v1/assets/{id}&#x60;](#tag/assets/GET/v1/assets/{id}). The depreciation of an asset over time is shown by [&#x60;GET /v1/assets/{id}/schedule&#x60;](#tag/depreciation/GET/v1/assets/{id}/schedule), and all assets together by the report [&#x60;GET /v1/reports/asset-register&#x60;](#tag/reports/GET/v1/reports/asset-register).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  AssetsApi,
} from '@zerpto/sdk';
import type { ListAssetsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AssetsApi(config);

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
    // string | Filter by category. (optional)
    categoryId: categoryId_example,
    // 'active' | 'fully_depreciated' | 'disposed' | Filter by status. (optional)
    status: status_example,
  } satisfies ListAssetsRequest;

  try {
    const data = await api.listAssets(body);
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
| **categoryId** | `string` | Filter by category. | [Optional] [Defaults to `undefined`] |
| **status** | `active`, `fully_depreciated`, `disposed` | Filter by status. | [Optional] [Defaults to `undefined`] [Enum: active, fully_depreciated, disposed] |

### Return type

[**AssetListResponse**](AssetListResponse.md)

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


## updateAsset

> AssetResponse updateAsset(id, assetUpdate)

Update asset

Changes an asset. Send only the fields you want to change: the &#x60;name&#x60;, the &#x60;category_id&#x60;, the &#x60;salvage_value&#x60;, the &#x60;useful_life_months&#x60; or the &#x60;location&#x60;. The cost and the acquisition date are fixed. A change of life or salvage value only affects depreciation that is posted afterwards; what was posted stays. A disposed asset can no longer be changed, and the call returns 409.  Read the current asset with [&#x60;GET /v1/assets/{id}&#x60;](#tag/assets/GET/v1/assets/{id}) first, and take a new &#x60;category_id&#x60; from [&#x60;GET /v1/assets/categories&#x60;](#tag/categories/GET/v1/assets/categories). To take an asset out of the register, use [&#x60;POST /v1/assets/{id}/dispose&#x60;](#tag/assets/POST/v1/assets/{id}/dispose) instead.  Error codes: &#x60;asset_disposed&#x60;, &#x60;unknown_category&#x60;, &#x60;category_archived&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AssetsApi,
} from '@zerpto/sdk';
import type { UpdateAssetRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AssetsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // AssetUpdate
    assetUpdate: ...,
  } satisfies UpdateAssetRequest;

  try {
    const data = await api.updateAsset(body);
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
| **assetUpdate** | [AssetUpdate](AssetUpdate.md) |  | |

### Return type

[**AssetResponse**](AssetResponse.md)

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

