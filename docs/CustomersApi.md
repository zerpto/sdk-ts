# CustomersApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**archiveCustomer**](CustomersApi.md#archivecustomer) | **DELETE** /v1/customers/{id} | Archive Customer |
| [**createCustomer**](CustomersApi.md#createcustomer) | **POST** /v1/customers | Create customer |
| [**getCustomer**](CustomersApi.md#getcustomer) | **GET** /v1/customers/{id} | Get Customer |
| [**listCustomers**](CustomersApi.md#listcustomers) | **GET** /v1/customers | List customers |
| [**updateCustomer**](CustomersApi.md#updatecustomer) | **PATCH** /v1/customers/{id} | Update Customer |



## archiveCustomer

> archiveCustomer(id)

Archive Customer

Archives a customer so it can no longer be chosen on new invoices and payments. The record is kept, with its history, and its status becomes &#x60;archived&#x60;. Use it for a customer you stopped selling to. Nothing is deleted, so old invoices and payments still show the customer, and the call returns 204 with no body.  A customer with unpaid or draft invoices cannot be archived: collect them with [&#x60;POST /v1/ar/payments&#x60;](#tag/accounts-receivable/POST/v1/ar/payments) or void them first, then call this again. Find archived customers again with &#x60;status&#x3D;archived&#x60; on [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers).  Error codes: &#x60;customer_has_open_invoices&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  CustomersApi,
} from '@zerpto/sdk';
import type { ArchiveCustomerRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies ArchiveCustomerRequest;

  try {
    const data = await api.archiveCustomer(body);
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


## createCustomer

> CustomerResponse createCustomer(customerInput, idempotencyKey)

Create customer

Creates a customer, someone you invoice and receive payments from. Send a unique &#x60;code&#x60; and a &#x60;name&#x60;; email, phone, NPWP, address and payment terms are optional, and &#x60;payment_terms_days&#x60; defaults to 30. The address is either a &#x60;region_id&#x60; picked from the region tree plus &#x60;line1&#x60;, or typed fields for a country without region data. The customer starts &#x60;active&#x60;, and a repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Get a &#x60;region_id&#x60; for the address from [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions). The returned &#x60;id&#x60; is the &#x60;customer_id&#x60; for [&#x60;POST /v1/ar/invoices&#x60;](#tag/accounts-receivable/POST/v1/ar/invoices) and [&#x60;POST /v1/ar/payments&#x60;](#tag/accounts-receivable/POST/v1/ar/payments). Change the record later with [&#x60;PATCH /v1/customers/{id}&#x60;](#tag/customers/PATCH/v1/customers/{id}), and read it with [&#x60;GET /v1/customers/{id}&#x60;](#tag/customers/GET/v1/customers/{id}).  Error codes: &#x60;code_taken&#x60;, &#x60;unknown_region&#x60;, &#x60;invalid_tax_id&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomersApi,
} from '@zerpto/sdk';
import type { CreateCustomerRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomersApi(config);

  const body = {
    // CustomerInput
    customerInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateCustomerRequest;

  try {
    const data = await api.createCustomer(body);
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
| **customerInput** | [CustomerInput](CustomerInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**CustomerResponse**](CustomerResponse.md)

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


## getCustomer

> CustomerResponse getCustomer(id)

Get Customer

Returns one customer by its &#x60;id&#x60;, with code, name, email, phone, NPWP, address, payment terms, status and timestamps. Use it to show a customer\&#39;s details, to prefill an edit form, or to check the payment terms before you raise an invoice. Archived customers can still be read, so old invoices keep a customer they can point to.  Take the &#x60;id&#x60; from [&#x60;GET /v1/customers&#x60;](#tag/customers/GET/v1/customers) or from the response of [&#x60;POST /v1/customers&#x60;](#tag/customers/POST/v1/customers). It is the same id that appears as &#x60;customer_id&#x60; on the invoices of [&#x60;GET /v1/ar/invoices&#x60;](#tag/accounts-receivable/GET/v1/ar/invoices). Change it with [&#x60;PATCH /v1/customers/{id}&#x60;](#tag/customers/PATCH/v1/customers/{id}).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomersApi,
} from '@zerpto/sdk';
import type { GetCustomerRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetCustomerRequest;

  try {
    const data = await api.getCustomer(body);
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

[**CustomerResponse**](CustomerResponse.md)

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


## listCustomers

> CustomerListResponse listCustomers(perPage, page, sort, createdAfter, createdBefore, status, q)

List customers

Lists the customers you sell to, with their contact details, NPWP, address and payment terms. Use it to fill a customer picker on invoices and payments, or to browse and reconcile your customer list. Filter by &#x60;status&#x60;, search by code or name with &#x60;q&#x60;, and narrow by creation date. Use &#x60;status&#x3D;archived&#x60; to see the customers you stopped selling to.  A customer found here is chosen by its &#x60;id&#x60; as the &#x60;customer_id&#x60; of [&#x60;POST /v1/ar/invoices&#x60;](#tag/accounts-receivable/POST/v1/ar/invoices) and of [&#x60;POST /v1/ar/payments&#x60;](#tag/accounts-receivable/POST/v1/ar/payments), and the same &#x60;customer_id&#x60; filters their lists, such as [&#x60;GET /v1/ar/invoices&#x60;](#tag/accounts-receivable/GET/v1/ar/invoices). New customers are added with [&#x60;POST /v1/customers&#x60;](#tag/customers/POST/v1/customers), and one record is read with [&#x60;GET /v1/customers/{id}&#x60;](#tag/customers/GET/v1/customers/{id}).  Error codes: none specific.  **Response meta** - &#x60;pagination&#x60;: &#x60;page&#x60;, &#x60;per_page&#x60;, &#x60;total_items&#x60;, &#x60;total_pages&#x60;, and the paging URLs &#x60;self&#x60;, &#x60;first&#x60;, &#x60;prev&#x60;, &#x60;next&#x60;, &#x60;last&#x60; (&#x60;prev&#x60; and &#x60;next&#x60; are null at the ends). Use &#x60;?page&#x3D;&#x60; and &#x60;?per_page&#x3D;&#x60;. 

### Example

```ts
import {
  Configuration,
  CustomersApi,
} from '@zerpto/sdk';
import type { ListCustomersRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomersApi(config);

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
    // string | Search by code or name. (optional)
    q: q_example,
  } satisfies ListCustomersRequest;

  try {
    const data = await api.listCustomers(body);
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
| **q** | `string` | Search by code or name. | [Optional] [Defaults to `undefined`] |

### Return type

[**CustomerListResponse**](CustomerListResponse.md)

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


## updateCustomer

> CustomerResponse updateCustomer(id, customerUpdate)

Update Customer

Changes fields of a customer. Send only the fields you want to change; the others stay as they are. Set &#x60;email&#x60;, &#x60;phone&#x60; or &#x60;tax_id&#x60; to &#x60;null&#x60; to clear them. To change the address, send the whole &#x60;address&#x60; object, because it replaces the old one. You cannot change &#x60;status&#x60; here: archive with the delete call.  Read the current record first with [&#x60;GET /v1/customers/{id}&#x60;](#tag/customers/GET/v1/customers/{id}). Invoices that are already posted keep the customer &#x60;id&#x60;, so a new name or terms shows on them from now on but does not alter their posted amounts. A &#x60;region_id&#x60; for a new address comes from [&#x60;GET /v1/regions&#x60;](#tag/regions/GET/v1/regions).  Error codes: &#x60;code_taken&#x60;, &#x60;unknown_region&#x60;, &#x60;invalid_tax_id&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  CustomersApi,
} from '@zerpto/sdk';
import type { UpdateCustomerRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new CustomersApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // CustomerUpdate
    customerUpdate: ...,
  } satisfies UpdateCustomerRequest;

  try {
    const data = await api.updateCustomer(body);
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
| **customerUpdate** | [CustomerUpdate](CustomerUpdate.md) |  | |

### Return type

[**CustomerResponse**](CustomerResponse.md)

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

