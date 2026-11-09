# PricingApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getPricing**](PricingApi.md#getpricing) | **GET** /v1/pricing | Get the seat price |
| [**listFeatures**](PricingApi.md#listfeatures) | **GET** /v1/features | List free and paid features |



## getPricing

> SeatPriceListResponse getPricing()

Get the seat price

Public price list, no authentication. Zerpto charges one price per seat per month, with PPN already included, no tiers and no discounts. Each entry gives the price in one currency, with the base price and the PPN shown separately for information. Use it to show pricing before someone signs up, or to work out what a number of seats costs.  An invoice total is the number of seats times the seat price, and a seat added mid-period is charged for the days left only. The features that come with it are listed by [&#x60;GET /v1/features&#x60;](#tag/pricing/GET/v1/features). Seats are bought with [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription), and a free trial is started with [&#x60;POST /v1/billing/trial&#x60;](#tag/billing/POST/v1/billing/trial).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PricingApi,
} from '@zerpto/sdk';
import type { GetPricingRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new PricingApi();

  try {
    const data = await api.getPricing();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**SeatPriceListResponse**](SeatPriceListResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## listFeatures

> FeatureListResponse listFeatures()

List free and paid features

Public catalogue of the features, each with the lowest plan that includes it: &#x60;free&#x60; or &#x60;paid&#x60;. Free features work for every tenant. Paid features unlock during the free trial and while the subscription is paid. A feature that costs Zerpto per use from a third party, such as file storage, is always &#x60;paid&#x60;. Use it to build the pricing page or to show a lock next to a paid feature. Zerpto can move a feature between the two plans without a new API version, so read the list instead of hard-coding it.  Each &#x60;key&#x60; is the permission key that the role editor uses in [&#x60;GET /v1/permissions&#x60;](#tag/roles-and-permissions/GET/v1/permissions). A user may do something only when both the role and the plan allow it: the role grants the permission, and the plan decides whether the tenant has the feature. The plan follows the &#x60;status&#x60; from [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription): &#x60;free&#x60; and &#x60;overdue&#x60; have the free features, &#x60;trial&#x60; and &#x60;paid&#x60; have all of them. A call to a feature the plan lacks is refused with 403 &#x60;plan_required&#x60;, and the &#x60;message&#x60; names the feature &#x60;key&#x60;. Unlock them with [&#x60;POST /v1/billing/trial&#x60;](#tag/billing/POST/v1/billing/trial) or [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription), and see the seat price in [&#x60;GET /v1/pricing&#x60;](#tag/pricing/GET/v1/pricing).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PricingApi,
} from '@zerpto/sdk';
import type { ListFeaturesRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new PricingApi();

  try {
    const data = await api.listFeatures();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**FeatureListResponse**](FeatureListResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

