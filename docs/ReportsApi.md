# ReportsApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**getApAging**](ReportsApi.md#getapaging) | **GET** /v1/reports/ap-aging | AP aging |
| [**getArAging**](ReportsApi.md#getaraging) | **GET** /v1/reports/ar-aging | AR aging |
| [**getAssetRegister**](ReportsApi.md#getassetregister) | **GET** /v1/reports/asset-register | Asset register report |
| [**getBalanceSheet**](ReportsApi.md#getbalancesheet) | **GET** /v1/reports/balance-sheet | Balance sheet |
| [**getBankReconciliationReport**](ReportsApi.md#getbankreconciliationreport) | **GET** /v1/reports/bank-reconciliation | Bank reconciliation report |
| [**getCashBalances**](ReportsApi.md#getcashbalances) | **GET** /v1/reports/cash-balances | Cash account balances |
| [**getInventoryValuation**](ReportsApi.md#getinventoryvaluation) | **GET** /v1/reports/inventory-valuation | Inventory valuation |
| [**getPphWithholdingReport**](ReportsApi.md#getpphwithholdingreport) | **GET** /v1/reports/pph-withholding | Withholding report per period |
| [**getPpnReport**](ReportsApi.md#getppnreport) | **GET** /v1/reports/ppn | PPN input vs output report |
| [**getProfitAndLoss**](ReportsApi.md#getprofitandloss) | **GET** /v1/reports/profit-and-loss | Profit and loss |
| [**getStockCard**](ReportsApi.md#getstockcard) | **GET** /v1/reports/stock-card | Stock card per item |
| [**getTrialBalance**](ReportsApi.md#gettrialbalance) | **GET** /v1/reports/trial-balance | Trial balance |



## getApAging

> AgingReportResponse getApAging(asOf)

AP aging

Returns what you owe your vendors as of a date, grouped by vendor into current and overdue buckets (1-30, 31-60, 61-90 and over 90 days), with each vendor\&#39;s total and a grand &#x60;totals&#x60; at the bottom. Use it to see who needs paying soon and how overdue you already are.  Take the vendor behind each &#x60;party_id&#x60; from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors), and the open bills behind the balance from [&#x60;GET /v1/ap/invoices&#x60;](#tag/invoice/GET/v1/ap/invoices). Settle a balance with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns what your customers owe as of a date, grouped by customer into current and overdue buckets (1-30, 31-60, 61-90 and over 90 days), with each customer\&#39;s total and a grand &#x60;totals&#x60; at the bottom. Use it to see who to chase for payment and how overdue they are.  Take the customer behind each &#x60;party_id&#x60; from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers), and the open invoices behind the balance from [&#x60;GET /v1/ar/invoices&#x60;](#tag/customer-invoice/GET/v1/ar/invoices). Settle a balance with [&#x60;POST /v1/ar/payments&#x60;](#tag/customer-payment/POST/v1/ar/payments).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns every fixed asset as of a date, one line per asset with its cost, accumulated depreciation and net book value, plus the totals across all of them. Use it to see what the business owns and its current carrying value, for an audit or a management report.  Limit it to one category with the &#x60;category_id&#x60; from [&#x60;GET /v1/assets/categories&#x60;](#tag/categories/GET/v1/assets/categories). Each line\&#39;s &#x60;asset_id&#x60; is read in full with [&#x60;GET /v1/assets/{id}&#x60;](#tag/fixed-assets/GET/v1/assets/{id}), including its depreciation schedule. &#x60;total_net_book_value&#x60; matches the fixed asset accounts\&#39; combined balance on [&#x60;GET /v1/reports/trial-balance&#x60;](#tag/reports/GET/v1/reports/trial-balance).  Error codes: &#x60;unknown_category&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns assets, liabilities and equity as of a date, each grouped into sections with the accounts\&#39; amounts and a section total, with &#x60;total_assets&#x60; and &#x60;total_liabilities_and_equity&#x60; matching at the bottom. Use it to see what the business owns, owes and is worth on a given day.  The sections follow the &#x60;type&#x60; on [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). The same balances, ungrouped, are in [&#x60;GET /v1/reports/trial-balance&#x60;](#tag/reports/GET/v1/reports/trial-balance), and the &#x60;net_income&#x60; from [&#x60;GET /v1/reports/profit-and-loss&#x60;](#tag/reports/GET/v1/reports/profit-and-loss) for the year to date is what carries into equity between statements.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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


## getCashBalances

> CashBalancesResponse getCashBalances(asOf, cashAccountId)

Cash account balances

Returns the balance of your cash accounts (bank, e-wallet and physical cash) as of a date, each row with its &#x60;cash_account_id&#x60;, &#x60;kind&#x60;, name, currency and &#x60;balance&#x60;. Use it to show a cash position overview as of today or a past date, or, with &#x60;cash_account_id&#x60;, to look up one account\&#39;s balance on a specific date instead of only its current one.  List the accounts to choose from with [&#x60;GET /v1/cash/accounts&#x60;](#tag/cash-account/GET/v1/cash/accounts), which also carries each account\&#39;s balance as of now. This report is for the same balances as of any date, together or one at a time; it is built the same way as [&#x60;GET /v1/reports/trial-balance&#x60;](#tag/reports/GET/v1/reports/trial-balance), filtered to cash accounts.  Error codes: &#x60;unknown_cash_account&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  ReportsApi,
} from '@zerpto/sdk';
import type { GetCashBalancesRequest } from '@zerpto/sdk';

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
    // string | Return only this cash account\'s balance. (optional)
    cashAccountId: cashAccountId_example,
  } satisfies GetCashBalancesRequest;

  try {
    const data = await api.getCashBalances(body);
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
| **cashAccountId** | `string` | Return only this cash account\&#39;s balance. | [Optional] [Defaults to `undefined`] |

### Return type

[**CashBalancesResponse**](CashBalancesResponse.md)

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


## getInventoryValuation

> InventoryValuationResponse getInventoryValuation(asOf, warehouseId)

Inventory valuation

Returns what your stock is worth as of a date, one line per item and warehouse, at the moving-average cost, with a grand &#x60;total&#x60;. Use it to see the value sitting on the shelves, or to check one warehouse\&#39;s share of it.  Limit it to one place with the &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). The quantity on each line comes from the same stock as [&#x60;GET /v1/reports/stock-card&#x60;](#tag/reports/GET/v1/reports/stock-card), and the &#x60;total&#x60; always equals the inventory account\&#39;s balance on [&#x60;GET /v1/reports/trial-balance&#x60;](#tag/reports/GET/v1/reports/trial-balance).  Error codes: &#x60;unknown_warehouse&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns the PPh 23 you withheld from vendor bills over a date range, one line per withholding with its base amount, the amount withheld and the certificate number if issued, plus the period\&#39;s &#x60;total_base&#x60; and &#x60;total_withheld&#x60;. Use it to see what you withheld for the period, or, filtered to one vendor, what you withheld from them.  Take the &#x60;vendor_id&#x60; for the filter from [&#x60;GET /v1/vendors&#x60;](#tag/vendors/GET/v1/vendors). Each line is a withholding record, listed and created with [&#x60;GET /v1/tax/withholdings&#x60;](#tag/tax/GET/v1/tax/withholdings) and [&#x60;POST /v1/tax/withholdings&#x60;](#tag/tax/POST/v1/tax/withholdings), and recorded on the vendor bill it reduces.  Error codes: &#x60;invalid_date_range&#x60; (&#x60;end_date&#x60; before &#x60;start_date&#x60;).  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns output PPN from posted AR invoices and input PPN from posted AP bills over a date range, one line per invoice with its &#x60;dpp&#x60; (tax base) and &#x60;ppn&#x60;, plus the totals and &#x60;net_payable&#x60;, output minus input. A negative &#x60;net_payable&#x60; means a credit. Use it to see what PPN you owe or can claim back for the period before filing.  Each output line\&#39;s document is an AR invoice read with [&#x60;GET /v1/ar/invoices/{id}&#x60;](#tag/customer-invoice/GET/v1/ar/invoices/{id}); each input line is an AP bill read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}). The output side is also what [&#x60;GET /v1/tax/invoices&#x60;](#tag/tax/GET/v1/tax/invoices) turns into faktur pajak, one per posted invoice with PPN.  Error codes: &#x60;invalid_date_range&#x60; (&#x60;end_date&#x60; before &#x60;start_date&#x60;).  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns revenue and expenses for a date range, grouped into sections such as Revenue and Expenses, each with its accounts\&#39; amounts and a section total, ending in &#x60;net_income&#x60;. Use it to see how the business performed over a period, such as a month or a quarter.  The sections follow the &#x60;type&#x60; on [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). Revenue accounts move with posted customer invoices ([&#x60;POST /v1/ar/invoices/{id}/confirm&#x60;](#tag/customer-invoice/POST/v1/ar/invoices/{id}/confirm)) and income entries ([&#x60;POST /v1/income/{id}/confirm&#x60;](#tag/income/POST/v1/income/{id}/confirm)); expense accounts move with posted vendor bills and expenses ([&#x60;POST /v1/expenses/{id}/confirm&#x60;](#tag/expenses/POST/v1/expenses/{id}/confirm)). [&#x60;GET /v1/reports/trial-balance&#x60;](#tag/reports/GET/v1/reports/trial-balance) shows the same accounts without the date range.  Error codes: &#x60;invalid_date_range&#x60; (&#x60;end_date&#x60; before &#x60;start_date&#x60;).  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns every stock movement for one item over a date range, in order, with the running quantity left after each line, plus the opening and closing quantity for the range. Use it to trace exactly how an item\&#39;s stock reached its current level, for an audit or to investigate a discrepancy.  Take the &#x60;item_id&#x60; from [&#x60;GET /v1/items&#x60;](#tag/product-items/GET/v1/items) and, to limit it to one place, the &#x60;warehouse_id&#x60; from [&#x60;GET /v1/inventory/warehouses&#x60;](#tag/warehouses/GET/v1/inventory/warehouses). Each line\&#39;s &#x60;source_type&#x60; and &#x60;source_id&#x60; point back to the goods receipt, delivery, adjustment, transfer, or stocked expense or income line that moved the stock. [&#x60;GET /v1/reports/inventory-valuation&#x60;](#tag/reports/GET/v1/reports/inventory-valuation) shows the value of what is left instead of the movements that got it there.  Error codes: &#x60;unknown_item&#x60;, &#x60;unknown_warehouse&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

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

Returns the balance of every account in your chart of accounts as of a date, split into its debit and credit columns, with &#x60;total_debit&#x60; and &#x60;total_credit&#x60; at the bottom. Use it to confirm the books balance before trusting any other report, or to look up any single account\&#39;s current standing, including a cash or bank account\&#39;s.  List the accounts behind each row with [&#x60;GET /v1/accounts&#x60;](#tag/accounts/GET/v1/accounts). Every posted [&#x60;POST /v1/gl/journal-entries&#x60;](#tag/journal/POST/v1/gl/journal-entries), and every other posted document, feeds these balances. [&#x60;GET /v1/reports/balance-sheet&#x60;](#tag/reports/GET/v1/reports/balance-sheet) and [&#x60;GET /v1/reports/profit-and-loss&#x60;](#tag/reports/GET/v1/reports/profit-and-loss) regroup the same balances into statements, and [&#x60;GET /v1/reports/cash-balances&#x60;](#tag/reports/GET/v1/reports/cash-balances) is a shortcut for just your cash accounts.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

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

