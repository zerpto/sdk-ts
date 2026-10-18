# PurchaseBillApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**createBillFromPurchaseOrder**](PurchaseBillApi.md#createbillfrompurchaseorder) | **POST** /v1/purchasing/orders/{id}/bill | Create a bill from a PO |
| [**createBillFromReceipts**](PurchaseBillApi.md#createbillfromreceipts) | **POST** /v1/purchasing/bills | Create a bill from receipts |
| [**getInvoiceDocument**](PurchaseBillApi.md#getinvoicedocument) | **GET** /v1/purchasing/invoice-documents/{id} | Get an uploaded invoice file |
| [**uploadInvoiceDocument**](PurchaseBillApi.md#uploadinvoicedocument) | **POST** /v1/purchasing/invoice-documents | Upload a vendor invoice file |



## createBillFromPurchaseOrder

> ApInvoiceResponse createBillFromPurchaseOrder(id, billFromPurchaseOrderInput, idempotencyKey)

Create a bill from a PO

Creates a draft bill for a purchase order from the goods that have been received. By default it covers all posted receipts of the order that are not billed yet; send &#x60;receipt_ids&#x60; to bill only some of them. Its lines are filled from the receipt lines at the order price, so you can change quantity, price or add lines to match the vendor\&#39;s invoice. Send the &#x60;invoice_date&#x60;, and optionally the &#x60;due_date&#x60;, the vendor\&#39;s invoice number, an uploaded &#x60;document_id&#x60; and &#x60;apply_down_payments&#x60;. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the order id from [&#x60;GET /v1/purchasing/orders/{id}&#x60;](#tag/orders/GET/v1/purchasing/orders/{id}) and the receipts from [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts); the file for &#x60;document_id&#x60; comes from [&#x60;POST /v1/purchasing/invoice-documents&#x60;](#tag/purchase-bill/POST/v1/purchasing/invoice-documents). The result is a normal AP bill: edit it with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}), check it with [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match), then post it with [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm). For receipts across several orders of one vendor, use [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills). Each receipt can be on one bill only, and each file can back one bill only.  Error codes: &#x60;receipt_not_posted&#x60;, &#x60;receipt_already_billed&#x60;, &#x60;document_already_used&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;nothing_to_bill&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchaseBillApi,
} from '@zerpto/sdk';
import type { CreateBillFromPurchaseOrderRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchaseBillApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
    // BillFromPurchaseOrderInput
    billFromPurchaseOrderInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateBillFromPurchaseOrderRequest;

  try {
    const data = await api.createBillFromPurchaseOrder(body);
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
| **billFromPurchaseOrderInput** | [BillFromPurchaseOrderInput](BillFromPurchaseOrderInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## createBillFromReceipts

> ApInvoiceResponse createBillFromReceipts(billFromReceiptsInput, idempotencyKey)

Create a bill from receipts

Creates one draft bill from one or more posted goods receipts of the same vendor, which may belong to different purchase orders. Send the &#x60;receipt_ids&#x60;, the &#x60;invoice_date&#x60;, and optionally the &#x60;due_date&#x60;, the vendor\&#39;s invoice number, an uploaded &#x60;document_id&#x60;, notes and &#x60;apply_down_payments&#x60;. Its lines are filled from the receipt lines at the order price, so you can change quantity, price or add lines to match the vendor\&#39;s invoice. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Take the receipts from [&#x60;GET /v1/purchasing/receipts&#x60;](#tag/goods-receipt/GET/v1/purchasing/receipts), which shows the unbilled ones, and the file for &#x60;document_id&#x60; from [&#x60;POST /v1/purchasing/invoice-documents&#x60;](#tag/purchase-bill/POST/v1/purchasing/invoice-documents). The result is a normal AP bill: read it with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}), edit it with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}) until it is posted, check it with [&#x60;GET /v1/ap/invoices/{id}/match&#x60;](#tag/purchasing/GET/v1/ap/invoices/{id}/match), then call [&#x60;POST /v1/ap/invoices/{id}/confirm&#x60;](#tag/invoice/POST/v1/ap/invoices/{id}/confirm). Pay it with [&#x60;POST /v1/ap/payments&#x60;](#tag/payment/POST/v1/ap/payments). For one order only, [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) does the same with defaults.  Error codes: &#x60;receipt_not_posted&#x60;, &#x60;receipt_already_billed&#x60;, &#x60;document_already_used&#x60;, &#x60;vendor_mismatch&#x60;, &#x60;nothing_to_bill&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchaseBillApi,
} from '@zerpto/sdk';
import type { CreateBillFromReceiptsRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchaseBillApi(config);

  const body = {
    // BillFromReceiptsInput
    billFromReceiptsInput: ...,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies CreateBillFromReceiptsRequest;

  try {
    const data = await api.createBillFromReceipts(body);
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
| **billFromReceiptsInput** | [BillFromReceiptsInput](BillFromReceiptsInput.md) |  | |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**ApInvoiceResponse**](ApInvoiceResponse.md)

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
| **404** | Resource not found in this tenant. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getInvoiceDocument

> InvoiceDocumentResponse getInvoiceDocument(id)

Get an uploaded invoice file

Returns an uploaded vendor invoice file by its &#x60;id&#x60;, with its filename, type, size, status, the bill it backs and a &#x60;download_url&#x60;. Use it to show the original invoice next to a bill or to download it again. The &#x60;download_url&#x60; is a short-lived link, so request the file again when it has expired.  Take the &#x60;id&#x60; from the response of [&#x60;POST /v1/purchasing/invoice-documents&#x60;](#tag/purchase-bill/POST/v1/purchasing/invoice-documents), or from the &#x60;document_id&#x60; of a bill read with [&#x60;GET /v1/ap/invoices/{id}&#x60;](#tag/invoice/GET/v1/ap/invoices/{id}). The &#x60;bill_id&#x60; points to the bill that uses the file, created with [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) or [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills).  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchaseBillApi,
} from '@zerpto/sdk';
import type { GetInvoiceDocumentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchaseBillApi(config);

  const body = {
    // string | Resource ID.
    id: id_example,
  } satisfies GetInvoiceDocumentRequest;

  try {
    const data = await api.getInvoiceDocument(body);
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

[**InvoiceDocumentResponse**](InvoiceDocumentResponse.md)

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


## uploadInvoiceDocument

> InvoiceDocumentResponse uploadInvoiceDocument(file, idempotencyKey)

Upload a vendor invoice file

Uploads the vendor\&#39;s invoice as a file, to be the base for a bill. Send a PDF, JPEG or PNG of up to 10 MB as multipart form data in the &#x60;file&#x60; field. The file is stored with the status &#x60;unused&#x60; and the response gives its &#x60;id&#x60; and a short-lived &#x60;download_url&#x60;. A repeated request with the same &#x60;Idempotency-Key&#x60; returns the first result.  Pass the returned &#x60;id&#x60; as &#x60;document_id&#x60; to [&#x60;POST /v1/purchasing/orders/{id}/bill&#x60;](#tag/purchase-bill/POST/v1/purchasing/orders/{id}/bill) or [&#x60;POST /v1/purchasing/bills&#x60;](#tag/purchase-bill/POST/v1/purchasing/bills), or set it on a draft bill with [&#x60;PATCH /v1/ap/invoices/{id}&#x60;](#tag/invoice/PATCH/v1/ap/invoices/{id}). The status becomes &#x60;attached&#x60; and &#x60;bill_id&#x60; is filled once a bill uses it. Read the file again with [&#x60;GET /v1/purchasing/invoice-documents/{id}&#x60;](#tag/purchase-bill/GET/v1/purchasing/invoice-documents/{id}). A file can back one bill only.  Error codes: &#x60;unsupported_file_type&#x60;, &#x60;file_too_large&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  PurchaseBillApi,
} from '@zerpto/sdk';
import type { UploadInvoiceDocumentRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new PurchaseBillApi(config);

  const body = {
    // Blob | PDF, JPEG or PNG, up to 10 MB.
    file: BINARY_DATA_HERE,
    // string | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. (optional)
    idempotencyKey: idempotencyKey_example,
  } satisfies UploadInvoiceDocumentRequest;

  try {
    const data = await api.uploadInvoiceDocument(body);
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
| **file** | `Blob` | PDF, JPEG or PNG, up to 10 MB. | [Defaults to `undefined`] |
| **idempotencyKey** | `string` | Unique key (e.g. a UUID). Retrying with the same key returns the original result instead of creating a duplicate. Keys are kept for 24 hours. | [Optional] [Defaults to `undefined`] |

### Return type

[**InvoiceDocumentResponse**](InvoiceDocumentResponse.md)

### Authorization

[ApiKeyAuth](../README.md#ApiKeyAuth), [UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Success |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **403** | The key or user lacks permission for this action. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

