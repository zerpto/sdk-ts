# RegionsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getRegion**](RegionsApi.md#getregion) | **GET** /v1/regions/{id} | Get a region |
| [**listRegions**](RegionsApi.md#listregions) | **GET** /v1/regions | List regions |



## getRegion

> RegionResponse getRegion(id, include)

Get a region

Returns one region by id as a plain object. Add &#x60;include&#x3D;parent.parent&#x60; to get the regions above it nested in &#x60;parent&#x60;, one level for each &#x60;parent&#x60;, up to the country. Use it to show a saved address as a chain (country, province, district and so on), or to check that an id you stored is still valid.  The id comes from [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions) or from the &#x60;region_id&#x60; of an address, for example the one returned by [&#x60;GET /v1/tenant&#x60;](#tag/tenants/GET/v1/tenant). To move one level down from it, call [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions) with this id as &#x60;parent_id&#x60;.  Error codes: &#x60;invalid_include&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  RegionsApi,
} from '@zerpto/sdk';
import type { GetRegionRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RegionsApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // string | Adds the regions above each result in `parent`. `parent` adds one level, `parent.parent` two, and so on up to the country. Without it, `parent` is left out and each region is a plain object.  (optional)
    include: parent.parent,
  } satisfies GetRegionRequest;

  try {
    const data = await api.getRegion(body);
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
| **include** | `string` | Adds the regions above each result in &#x60;parent&#x60;. &#x60;parent&#x60; adds one level, &#x60;parent.parent&#x60; two, and so on up to the country. Without it, &#x60;parent&#x60; is left out and each region is a plain object.  | [Optional] [Defaults to `undefined`] |

### Return type

[**RegionResponse**](RegionResponse.md)

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


## listRegions

> RegionListResponse listRegions(parentId, q, include, perPage, page)

List regions

Lists the regions one level at a time, so a person can pick an address step by step. Without &#x60;parent_id&#x60; you get the top level, which is the countries. Pass the &#x60;id&#x60; of the region the person picked to get the level below it, and repeat until &#x60;has_children&#x60; is false or the level they need is reached. &#x60;q&#x60; narrows a level by name. Each region is a plain object, unless &#x60;include&#x60; asks for the regions above it.  The &#x60;id&#x60; you pick is the &#x60;region_id&#x60; of an address, in [&#x60;POST /v1/tenants&#x60;](#tag/tenants/POST/v1/tenants), [&#x60;PATCH /v1/tenant&#x60;](#tag/tenants/PATCH/v1/tenant), [&#x60;POST /v1/customers&#x60;](#tag/customers/POST/v1/customers), [&#x60;POST /v1/vendors&#x60;](#tag/vendors/POST/v1/vendors) and [&#x60;POST /v1/inventory/warehouses&#x60;](#tag/inventory/POST/v1/inventory/warehouses). To show an address that is already saved, read its region with [&#x60;GET /v1/regions/{id}&#x60;](#tag/regions/GET/v1/regions/{id}).  Error codes: &#x60;invalid_include&#x60;.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  RegionsApi,
} from '@zerpto/sdk';
import type { ListRegionsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new RegionsApi(config);

  const body = {
    // string | Return the children of this region. Omit it to get the top level (countries). (optional)
    parentId: reg-0192f3a1-5d2c-7e44-8b1f-3c9a6e0d7b25,
    // string | Only regions whose name contains this text, ignoring case. (optional)
    q: q_example,
    // string | Adds the regions above each result in `parent`. `parent` adds one level, `parent.parent` two, and so on up to the country. Without it, `parent` is left out and each region is a plain object.  (optional)
    include: parent.parent,
    // number | Page size. (optional)
    perPage: 56,
    // number | Page number, starting at 1. (optional)
    page: 56,
  } satisfies ListRegionsRequest;

  try {
    const data = await api.listRegions(body);
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
| **parentId** | `string` | Return the children of this region. Omit it to get the top level (countries). | [Optional] [Defaults to `undefined`] |
| **q** | `string` | Only regions whose name contains this text, ignoring case. | [Optional] [Defaults to `undefined`] |
| **include** | `string` | Adds the regions above each result in &#x60;parent&#x60;. &#x60;parent&#x60; adds one level, &#x60;parent.parent&#x60; two, and so on up to the country. Without it, &#x60;parent&#x60; is left out and each region is a plain object.  | [Optional] [Defaults to `undefined`] |
| **perPage** | `number` | Page size. | [Optional] [Defaults to `25`] |
| **page** | `number` | Page number, starting at 1. | [Optional] [Defaults to `1`] |

### Return type

[**RegionListResponse**](RegionListResponse.md)

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
| **404** | Resource not found in this tenant. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

