# PricingApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getPricing**](PricingApi.md#getpricing) | **GET** /v1/pricing | Get the seat price |
| [**listFeatures**](PricingApi.md#listfeatures) | **GET** /v1/features | List basic and paid features |



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

List basic and paid features

Public catalogue of the features, each marked &#x60;basic&#x60; or &#x60;paid&#x60;. Basic features work for every tenant. Paid features unlock during the free trial and while a subscription is paid. Use it to build the pricing page or to show a lock next to a paid feature. Zerpto can move a feature between the two tiers without a new API version, so read the list instead of hard-coding it.  Whether a tenant has the paid features follows the &#x60;status&#x60; from [&#x60;GET /v1/billing/subscription&#x60;](#tag/billing/GET/v1/billing/subscription): &#x60;free&#x60; and &#x60;overdue&#x60; lock them, &#x60;trial&#x60; and &#x60;paid&#x60; unlock them. A call to a locked paid feature is refused with 403 &#x60;feature_locked&#x60;, and the &#x60;message&#x60; names the feature &#x60;key&#x60;. Unlock them with [&#x60;POST /v1/billing/trial&#x60;](#tag/billing/POST/v1/billing/trial) or [&#x60;POST /v1/billing/subscription&#x60;](#tag/billing/POST/v1/billing/subscription), and see the seat price in [&#x60;GET /v1/pricing&#x60;](#tag/pricing/GET/v1/pricing).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

