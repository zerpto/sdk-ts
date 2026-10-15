# ReportsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getApAging**](ReportsApi.md#getapaging) | **GET** /v1/reports/ap-aging | AP aging |
| [**getArAging**](ReportsApi.md#getaraging) | **GET** /v1/reports/ar-aging | AR aging |
| [**getAssetRegister**](ReportsApi.md#getassetregister) | **GET** /v1/reports/asset-register | Asset register report |
| [**getBalanceSheet**](ReportsApi.md#getbalancesheet) | **GET** /v1/reports/balance-sheet | Balance sheet |
| [**getBankReconciliationReport**](ReportsApi.md#getbankreconciliationreport) | **GET** /v1/reports/bank-reconciliation | Bank reconciliation report |
| [**getInventoryValuation**](ReportsApi.md#getinventoryvaluation) | **GET** /v1/reports/inventory-valuation | Inventory valuation |
| [**getPphWithholdingReport**](ReportsApi.md#getpphwithholdingreport) | **GET** /v1/reports/pph-withholding | Withholding report per period |
| [**getPpnReport**](ReportsApi.md#getppnreport) | **GET** /v1/reports/ppn | PPN input vs output report |
| [**getProfitAndLoss**](ReportsApi.md#getprofitandloss) | **GET** /v1/reports/profit-and-loss | Profit and loss |
| [**getStockCard**](ReportsApi.md#getstockcard) | **GET** /v1/reports/stock-card | Stock card per item |
| [**getTrialBalance**](ReportsApi.md#gettrialbalance) | **GET** /v1/reports/trial-balance | Trial balance |



## getApAging

> AgingReportResponse getApAging(asOf)

AP aging

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetApAgingRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Report date. Defaults to today. (optional)
    asOf: 2013-10-20,
  } satisfies GetApAgingRequest;

  try {
    const data = await api.getApAging(body);
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
| **asOf** | `Date` | Report date. Defaults to today. | [Optional] [Defaults to `undefined`] |

### Return type

[**AgingReportResponse**](AgingReportResponse.md)

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


## getArAging

> AgingReportResponse getArAging(asOf)

AR aging

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetArAgingRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Report date. Defaults to today. (optional)
    asOf: 2013-10-20,
  } satisfies GetArAgingRequest;

  try {
    const data = await api.getArAging(body);
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
| **asOf** | `Date` | Report date. Defaults to today. | [Optional] [Defaults to `undefined`] |

### Return type

[**AgingReportResponse**](AgingReportResponse.md)

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


## getAssetRegister

> AssetRegisterResponse getAssetRegister(asOf, categoryId)

Asset register report

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetAssetRegisterRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Report date. Defaults to today. (optional)
    asOf: 2013-10-20,
    // string | Limit to one category. (optional)
    categoryId: categoryId_example,
  } satisfies GetAssetRegisterRequest;

  try {
    const data = await api.getAssetRegister(body);
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
| **asOf** | `Date` | Report date. Defaults to today. | [Optional] [Defaults to `undefined`] |
| **categoryId** | `string` | Limit to one category. | [Optional] [Defaults to `undefined`] |

### Return type

[**AssetRegisterResponse**](AssetRegisterResponse.md)

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


## getBalanceSheet

> BalanceSheetResponse getBalanceSheet(asOf)

Balance sheet

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetBalanceSheetRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Report date. Defaults to today. (optional)
    asOf: 2013-10-20,
  } satisfies GetBalanceSheetRequest;

  try {
    const data = await api.getBalanceSheet(body);
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
| **asOf** | `Date` | Report date. Defaults to today. | [Optional] [Defaults to `undefined`] |

### Return type

[**BalanceSheetResponse**](BalanceSheetResponse.md)

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


## getBankReconciliationReport

> BankReconciliationReportResponse getBankReconciliationReport(reconciliationId)

Bank reconciliation report

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetBankReconciliationReportRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // string | Reconciliation to report on.
    reconciliationId: reconciliationId_example,
  } satisfies GetBankReconciliationReportRequest;

  try {
    const data = await api.getBankReconciliationReport(body);
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
| **reconciliationId** | `string` | Reconciliation to report on. | [Defaults to `undefined`] |

### Return type

[**BankReconciliationReportResponse**](BankReconciliationReportResponse.md)

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


## getInventoryValuation

> InventoryValuationResponse getInventoryValuation(asOf, warehouseId)

Inventory valuation

Moving-average valuation. Its total equals the GL inventory account balance.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetInventoryValuationRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Report date. Defaults to today. (optional)
    asOf: 2013-10-20,
    // string | Limit to one warehouse. (optional)
    warehouseId: warehouseId_example,
  } satisfies GetInventoryValuationRequest;

  try {
    const data = await api.getInventoryValuation(body);
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
| **asOf** | `Date` | Report date. Defaults to today. | [Optional] [Defaults to `undefined`] |
| **warehouseId** | `string` | Limit to one warehouse. | [Optional] [Defaults to `undefined`] |

### Return type

[**InventoryValuationResponse**](InventoryValuationResponse.md)

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


## getPphWithholdingReport

> WithholdingReportResponse getPphWithholdingReport(startDate, endDate, vendorId)

Withholding report per period

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetPphWithholdingReportRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Start of the reporting range.
    startDate: 2013-10-20,
    // Date | End of the reporting range.
    endDate: 2013-10-20,
    // string | Limit to one vendor. (optional)
    vendorId: vendorId_example,
  } satisfies GetPphWithholdingReportRequest;

  try {
    const data = await api.getPphWithholdingReport(body);
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
| **startDate** | `Date` | Start of the reporting range. | [Defaults to `undefined`] |
| **endDate** | `Date` | End of the reporting range. | [Defaults to `undefined`] |
| **vendorId** | `string` | Limit to one vendor. | [Optional] [Defaults to `undefined`] |

### Return type

[**WithholdingReportResponse**](WithholdingReportResponse.md)

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


## getPpnReport

> PpnReportResponse getPpnReport(startDate, endDate)

PPN input vs output report

Output PPN from posted AR invoices, input PPN from posted AP bills. &#x60;net_payable&#x60; is output minus input; negative means a credit.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetPpnReportRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Start of the reporting range.
    startDate: 2013-10-20,
    // Date | End of the reporting range.
    endDate: 2013-10-20,
  } satisfies GetPpnReportRequest;

  try {
    const data = await api.getPpnReport(body);
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
| **startDate** | `Date` | Start of the reporting range. | [Defaults to `undefined`] |
| **endDate** | `Date` | End of the reporting range. | [Defaults to `undefined`] |

### Return type

[**PpnReportResponse**](PpnReportResponse.md)

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


## getProfitAndLoss

> ProfitAndLossResponse getProfitAndLoss(startDate, endDate)

Profit and loss

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetProfitAndLossRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Start of the reporting range.
    startDate: 2013-10-20,
    // Date | End of the reporting range.
    endDate: 2013-10-20,
  } satisfies GetProfitAndLossRequest;

  try {
    const data = await api.getProfitAndLoss(body);
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
| **startDate** | `Date` | Start of the reporting range. | [Defaults to `undefined`] |
| **endDate** | `Date` | End of the reporting range. | [Defaults to `undefined`] |

### Return type

[**ProfitAndLossResponse**](ProfitAndLossResponse.md)

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


## getStockCard

> StockCardResponse getStockCard(itemId, startDate, endDate, warehouseId)

Stock card per item

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetStockCardRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // string | Item.
    itemId: itemId_example,
    // Date | Start of the reporting range.
    startDate: 2013-10-20,
    // Date | End of the reporting range.
    endDate: 2013-10-20,
    // string | Limit to one warehouse. Defaults to all. (optional)
    warehouseId: warehouseId_example,
  } satisfies GetStockCardRequest;

  try {
    const data = await api.getStockCard(body);
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
| **itemId** | `string` | Item. | [Defaults to `undefined`] |
| **startDate** | `Date` | Start of the reporting range. | [Defaults to `undefined`] |
| **endDate** | `Date` | End of the reporting range. | [Defaults to `undefined`] |
| **warehouseId** | `string` | Limit to one warehouse. Defaults to all. | [Optional] [Defaults to `undefined`] |

### Return type

[**StockCardResponse**](StockCardResponse.md)

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


## getTrialBalance

> TrialBalanceResponse getTrialBalance(asOf)

Trial balance

**Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetTrialBalanceRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new ReportsApi(config);

  const body = {
    // Date | Report date. Defaults to today. (optional)
    asOf: 2013-10-20,
  } satisfies GetTrialBalanceRequest;

  try {
    const data = await api.getTrialBalance(body);
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
| **asOf** | `Date` | Report date. Defaults to today. | [Optional] [Defaults to `undefined`] |

### Return type

[**TrialBalanceResponse**](TrialBalanceResponse.md)

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

