# @zerpto/sdk@1.0.0

A TypeScript SDK client for the api.zerpto.com API.

## Usage

First, install the SDK from npm.

```bash
npm install @zerpto/sdk --save
```

Next, try it out.


```ts
import {
  Configuration,
  APIKeysApi,
} from '@zerpto/sdk';
import type { CreateApiKeyRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: ApiKeyAuth
    accessToken: "YOUR BEARER TOKEN",
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new APIKeysApi(config);

  const body = {
    // ApiKeyInput
    apiKeyInput: ...,
  } satisfies CreateApiKeyRequest;

  try {
    const data = await api.createApiKey(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```


## Documentation

### API Endpoints

All URIs are relative to *https://api.zerpto.com*

| Class | Method | HTTP request | Description
| ----- | ------ | ------------ | -------------
*APIKeysApi* | [**createApiKey**](docs/APIKeysApi.md#createapikey) | **POST** /v1/api-keys | Create API key
*APIKeysApi* | [**getUsage**](docs/APIKeysApi.md#getusage) | **GET** /v1/usage | Usage and rate-limit status
*APIKeysApi* | [**listApiKeys**](docs/APIKeysApi.md#listapikeys) | **GET** /v1/api-keys | List API keys (masked)
*APIKeysApi* | [**revokeApiKey**](docs/APIKeysApi.md#revokeapikey) | **DELETE** /v1/api-keys/{id} | Revoke API key
*APIKeysApi* | [**rotateApiKey**](docs/APIKeysApi.md#rotateapikey) | **POST** /v1/api-keys/{id}/rotate | Rotate API key
*AccountsPayableApi* | [**allocateApCreditNote**](docs/AccountsPayableApi.md#allocateapcreditnote) | **POST** /v1/ap/credit-notes/{id}/allocations | Apply a credit note to bills
*AccountsPayableApi* | [**allocateApPayment**](docs/AccountsPayableApi.md#allocateappayment) | **POST** /v1/ap/payments/{id}/allocations | Apply payment to bills
*AccountsPayableApi* | [**createApCreditNote**](docs/AccountsPayableApi.md#createapcreditnote) | **POST** /v1/ap/credit-notes | Create credit note
*AccountsPayableApi* | [**createApInvoice**](docs/AccountsPayableApi.md#createapinvoice) | **POST** /v1/ap/invoices | Create invoice
*AccountsPayableApi* | [**createApPayment**](docs/AccountsPayableApi.md#createappayment) | **POST** /v1/ap/payments | Record a payment
*AccountsPayableApi* | [**getApCreditNote**](docs/AccountsPayableApi.md#getapcreditnote) | **GET** /v1/ap/credit-notes/{id} | Get credit note
*AccountsPayableApi* | [**getApInvoice**](docs/AccountsPayableApi.md#getapinvoice) | **GET** /v1/ap/invoices/{id} | Get ApInvoice
*AccountsPayableApi* | [**getApPayment**](docs/AccountsPayableApi.md#getappayment) | **GET** /v1/ap/payments/{id} | Get payment
*AccountsPayableApi* | [**listApCreditNotes**](docs/AccountsPayableApi.md#listapcreditnotes) | **GET** /v1/ap/credit-notes | List credit notes
*AccountsPayableApi* | [**listApInvoices**](docs/AccountsPayableApi.md#listapinvoices) | **GET** /v1/ap/invoices | List invoices
*AccountsPayableApi* | [**listApPayments**](docs/AccountsPayableApi.md#listappayments) | **GET** /v1/ap/payments | List payments
*AccountsPayableApi* | [**postApCreditNote**](docs/AccountsPayableApi.md#postapcreditnote) | **POST** /v1/ap/credit-notes/{id}/post | Post credit note to the GL
*AccountsPayableApi* | [**postApInvoice**](docs/AccountsPayableApi.md#postapinvoice) | **POST** /v1/ap/invoices/{id}/post | Post invoice to the GL
*AccountsPayableApi* | [**refundApCreditNote**](docs/AccountsPayableApi.md#refundapcreditnote) | **POST** /v1/ap/credit-notes/{id}/refunds | Record a vendor refund
*AccountsPayableApi* | [**removeApCreditNoteAllocation**](docs/AccountsPayableApi.md#removeapcreditnoteallocation) | **DELETE** /v1/ap/credit-notes/{id}/allocations/{invoice_id} | Remove a credit allocation
*AccountsPayableApi* | [**removeApPaymentAllocation**](docs/AccountsPayableApi.md#removeappaymentallocation) | **DELETE** /v1/ap/payments/{id}/allocations/{invoice_id} | Remove a payment allocation
*AccountsPayableApi* | [**updateApCreditNote**](docs/AccountsPayableApi.md#updateapcreditnote) | **PATCH** /v1/ap/credit-notes/{id} | Update credit note
*AccountsPayableApi* | [**updateApInvoice**](docs/AccountsPayableApi.md#updateapinvoice) | **PATCH** /v1/ap/invoices/{id} | Update ApInvoice
*AccountsPayableApi* | [**voidApCreditNote**](docs/AccountsPayableApi.md#voidapcreditnote) | **POST** /v1/ap/credit-notes/{id}/void | Void credit note
*AccountsPayableApi* | [**voidApInvoice**](docs/AccountsPayableApi.md#voidapinvoice) | **POST** /v1/ap/invoices/{id}/void | Void invoice
*AccountsReceivableApi* | [**createArInvoice**](docs/AccountsReceivableApi.md#createarinvoice) | **POST** /v1/ar/invoices | Create invoice
*AccountsReceivableApi* | [**createArPayment**](docs/AccountsReceivableApi.md#createarpayment) | **POST** /v1/ar/payments | Record a payment
*AccountsReceivableApi* | [**getArInvoice**](docs/AccountsReceivableApi.md#getarinvoice) | **GET** /v1/ar/invoices/{id} | Get ArInvoice
*AccountsReceivableApi* | [**getArPayment**](docs/AccountsReceivableApi.md#getarpayment) | **GET** /v1/ar/payments/{id} | Get payment
*AccountsReceivableApi* | [**listArInvoices**](docs/AccountsReceivableApi.md#listarinvoices) | **GET** /v1/ar/invoices | List invoices
*AccountsReceivableApi* | [**listArPayments**](docs/AccountsReceivableApi.md#listarpayments) | **GET** /v1/ar/payments | List payments
*AccountsReceivableApi* | [**postArInvoice**](docs/AccountsReceivableApi.md#postarinvoice) | **POST** /v1/ar/invoices/{id}/post | Post invoice to the GL
*AccountsReceivableApi* | [**updateArInvoice**](docs/AccountsReceivableApi.md#updatearinvoice) | **PATCH** /v1/ar/invoices/{id} | Update ArInvoice
*AccountsReceivableApi* | [**voidArInvoice**](docs/AccountsReceivableApi.md#voidarinvoice) | **POST** /v1/ar/invoices/{id}/void | Void invoice
*ApprovalsApi* | [**approveApproval**](docs/ApprovalsApi.md#approveapproval) | **POST** /v1/approvals/{id}/approve | Approve
*ApprovalsApi* | [**createApprovalRule**](docs/ApprovalsApi.md#createapprovalrule) | **POST** /v1/approval-rules | Create approval rule
*ApprovalsApi* | [**deleteApprovalRule**](docs/ApprovalsApi.md#deleteapprovalrule) | **DELETE** /v1/approval-rules/{id} | Remove approval rule
*ApprovalsApi* | [**getApprovalRule**](docs/ApprovalsApi.md#getapprovalrule) | **GET** /v1/approval-rules/{id} | Get approval rule
*ApprovalsApi* | [**listApprovalRules**](docs/ApprovalsApi.md#listapprovalrules) | **GET** /v1/approval-rules | List approval rules
*ApprovalsApi* | [**listApprovals**](docs/ApprovalsApi.md#listapprovals) | **GET** /v1/approvals | List approval requests
*ApprovalsApi* | [**rejectApproval**](docs/ApprovalsApi.md#rejectapproval) | **POST** /v1/approvals/{id}/reject | Reject
*ApprovalsApi* | [**updateApprovalRule**](docs/ApprovalsApi.md#updateapprovalrule) | **PATCH** /v1/approval-rules/{id} | Update approval rule
*AuthenticationApi* | [**acceptInvite**](docs/AuthenticationApi.md#acceptinvite) | **POST** /v1/auth/accept-invite | Accept invite, create account
*AuthenticationApi* | [**changePassword**](docs/AuthenticationApi.md#changepassword) | **PUT** /v1/auth/password | Change your password
*AuthenticationApi* | [**getMe**](docs/AuthenticationApi.md#getme) | **GET** /v1/auth/me | Current user and permissions
*AuthenticationApi* | [**login**](docs/AuthenticationApi.md#login) | **POST** /v1/auth/sign-in | Log in with email, password
*AuthenticationApi* | [**logout**](docs/AuthenticationApi.md#logout) | **DELETE** /v1/auth/sign-out | Log out of the session
*AuthenticationApi* | [**refreshToken**](docs/AuthenticationApi.md#refreshtoken) | **POST** /v1/auth/refresh | Refresh the access token
*AuthenticationApi* | [**register**](docs/AuthenticationApi.md#register) | **POST** /v1/auth/sign-up | Register a new account
*AuthenticationApi* | [**verifyEmail**](docs/AuthenticationApi.md#verifyemail) | **POST** /v1/auth/verify-email | Confirm an email address
*BankReconciliationApi* | [**completeBankReconciliation**](docs/BankReconciliationApi.md#completebankreconciliation) | **POST** /v1/bank/reconciliations/{id}/complete | Complete a reconciliation
*BankReconciliationApi* | [**createBankAccount**](docs/BankReconciliationApi.md#createbankaccount) | **POST** /v1/bank/accounts | Create bank account
*BankReconciliationApi* | [**createBankReconciliation**](docs/BankReconciliationApi.md#createbankreconciliation) | **POST** /v1/bank/reconciliations | Start a reconciliation
*BankReconciliationApi* | [**getBankAccount**](docs/BankReconciliationApi.md#getbankaccount) | **GET** /v1/bank/accounts/{id} | Get bank account
*BankReconciliationApi* | [**listBankAccounts**](docs/BankReconciliationApi.md#listbankaccounts) | **GET** /v1/bank/accounts | List bank accounts
*BankReconciliationApi* | [**listBankReconciliations**](docs/BankReconciliationApi.md#listbankreconciliations) | **GET** /v1/bank/reconciliations | List reconciliations
*BankReconciliationApi* | [**listBankStatementLines**](docs/BankReconciliationApi.md#listbankstatementlines) | **GET** /v1/bank/statements/{id}/lines | List statement lines
*BankReconciliationApi* | [**matchBankStatementLine**](docs/BankReconciliationApi.md#matchbankstatementline) | **POST** /v1/bank/statement-lines/{id}/match | Match a line
*BankReconciliationApi* | [**unmatchBankStatementLine**](docs/BankReconciliationApi.md#unmatchbankstatementline) | **POST** /v1/bank/statement-lines/{id}/unmatch | Remove a match
*BankReconciliationApi* | [**updateBankAccount**](docs/BankReconciliationApi.md#updatebankaccount) | **PATCH** /v1/bank/accounts/{id} | Update bank account
*BankReconciliationApi* | [**uploadBankStatement**](docs/BankReconciliationApi.md#uploadbankstatement) | **POST** /v1/bank/accounts/{id}/statements | Upload a statement file
*BillingApi* | [**cancelSubscription**](docs/BillingApi.md#cancelsubscription) | **POST** /v1/billing/subscription/cancel | Cancel at period end
*BillingApi* | [**changeApiPlan**](docs/BillingApi.md#changeapiplan) | **POST** /v1/billing/api-plan | Change API plan
*BillingApi* | [**createCheckout**](docs/BillingApi.md#createcheckout) | **POST** /v1/billing/checkout | Pay an invoice via gateway
*BillingApi* | [**createSubscription**](docs/BillingApi.md#createsubscription) | **POST** /v1/billing/subscription | Subscribe to a plan
*BillingApi* | [**getBillingInvoice**](docs/BillingApi.md#getbillinginvoice) | **GET** /v1/billing/invoices/{id} | Get subscription invoice
*BillingApi* | [**getBillingUsage**](docs/BillingApi.md#getbillingusage) | **GET** /v1/billing/usage | Usage for the current period
*BillingApi* | [**getSubscription**](docs/BillingApi.md#getsubscription) | **GET** /v1/billing/subscription | Get current plan and add-ons
*BillingApi* | [**getUsageAlerts**](docs/BillingApi.md#getusagealerts) | **GET** /v1/billing/usage-alerts | Get usage alert settings
*BillingApi* | [**listApiPlans**](docs/BillingApi.md#listapiplans) | **GET** /v1/billing/api-plans | List API quota plans
*BillingApi* | [**listBillingInvoices**](docs/BillingApi.md#listbillinginvoices) | **GET** /v1/billing/invoices | List subscription invoices
*BillingApi* | [**listBillingPayments**](docs/BillingApi.md#listbillingpayments) | **GET** /v1/billing/payments | List payment history
*BillingApi* | [**listBillingUsageHistory**](docs/BillingApi.md#listbillingusagehistory) | **GET** /v1/billing/usage/history | Past usage periods
*BillingApi* | [**receiveGatewayWebhook**](docs/BillingApi.md#receivegatewaywebhook) | **POST** /v1/billing/gateway-webhook | Payment gateway callback
*BillingApi* | [**updateSubscription**](docs/BillingApi.md#updatesubscription) | **PATCH** /v1/billing/subscription | Change plan, seats or add-on
*BillingApi* | [**updateUsageAlerts**](docs/BillingApi.md#updateusagealerts) | **PATCH** /v1/billing/usage-alerts | Update usage alert settings
*CustomersApi* | [**archiveCustomer**](docs/CustomersApi.md#archivecustomer) | **DELETE** /v1/customers/{id} | Archive Customer
*CustomersApi* | [**createCustomer**](docs/CustomersApi.md#createcustomer) | **POST** /v1/customers | Create customer
*CustomersApi* | [**getCustomer**](docs/CustomersApi.md#getcustomer) | **GET** /v1/customers/{id} | Get Customer
*CustomersApi* | [**listCustomers**](docs/CustomersApi.md#listcustomers) | **GET** /v1/customers | List customers
*CustomersApi* | [**updateCustomer**](docs/CustomersApi.md#updatecustomer) | **PATCH** /v1/customers/{id} | Update Customer
*FixedAssetsApi* | [**createAsset**](docs/FixedAssetsApi.md#createasset) | **POST** /v1/assets | Register an asset
*FixedAssetsApi* | [**createAssetCategory**](docs/FixedAssetsApi.md#createassetcategory) | **POST** /v1/assets/categories | Create asset category
*FixedAssetsApi* | [**createAssetFromBill**](docs/FixedAssetsApi.md#createassetfrombill) | **POST** /v1/assets/from-bill | Register asset from a bill
*FixedAssetsApi* | [**createDepreciationRun**](docs/FixedAssetsApi.md#createdepreciationrun) | **POST** /v1/assets/depreciation-runs | Run monthly depreciation
*FixedAssetsApi* | [**disposeAsset**](docs/FixedAssetsApi.md#disposeasset) | **POST** /v1/assets/{id}/dispose | Dispose or sell an asset
*FixedAssetsApi* | [**getAsset**](docs/FixedAssetsApi.md#getasset) | **GET** /v1/assets/{id} | Get asset
*FixedAssetsApi* | [**getAssetCategory**](docs/FixedAssetsApi.md#getassetcategory) | **GET** /v1/assets/categories/{id} | Get asset category
*FixedAssetsApi* | [**getAssetSchedule**](docs/FixedAssetsApi.md#getassetschedule) | **GET** /v1/assets/{id}/schedule | Depreciation schedule
*FixedAssetsApi* | [**getDepreciationRun**](docs/FixedAssetsApi.md#getdepreciationrun) | **GET** /v1/assets/depreciation-runs/{id} | Get a depreciation run
*FixedAssetsApi* | [**listAssetCategories**](docs/FixedAssetsApi.md#listassetcategories) | **GET** /v1/assets/categories | List asset categories
*FixedAssetsApi* | [**listAssets**](docs/FixedAssetsApi.md#listassets) | **GET** /v1/assets | List assets
*FixedAssetsApi* | [**updateAsset**](docs/FixedAssetsApi.md#updateasset) | **PATCH** /v1/assets/{id} | Update asset
*FixedAssetsApi* | [**updateAssetCategory**](docs/FixedAssetsApi.md#updateassetcategory) | **PATCH** /v1/assets/categories/{id} | Update asset category
*ForgotPasswordApi* | [**forgotPassword**](docs/ForgotPasswordApi.md#forgotpassword) | **POST** /v1/auth/reset-password | Send a password reset email
*ForgotPasswordApi* | [**resetPassword**](docs/ForgotPasswordApi.md#resetpassword) | **PUT** /v1/auth/reset-password | Reset password using a token
*GeneralLedgerApi* | [**archiveAccount**](docs/GeneralLedgerApi.md#archiveaccount) | **DELETE** /v1/accounts/{id} | Archive Account
*GeneralLedgerApi* | [**closePeriod**](docs/GeneralLedgerApi.md#closeperiod) | **POST** /v1/gl/periods/{id}/close | Close an accounting period
*GeneralLedgerApi* | [**createAccount**](docs/GeneralLedgerApi.md#createaccount) | **POST** /v1/accounts | Create account
*GeneralLedgerApi* | [**createJournalEntry**](docs/GeneralLedgerApi.md#createjournalentry) | **POST** /v1/gl/journal-entries | Post a manual journal entry
*GeneralLedgerApi* | [**getAccount**](docs/GeneralLedgerApi.md#getaccount) | **GET** /v1/accounts/{id} | Get Account
*GeneralLedgerApi* | [**getJournalEntry**](docs/GeneralLedgerApi.md#getjournalentry) | **GET** /v1/gl/journal-entries/{id} | Get journal entry
*GeneralLedgerApi* | [**listAccounts**](docs/GeneralLedgerApi.md#listaccounts) | **GET** /v1/accounts | List accounts
*GeneralLedgerApi* | [**listJournalEntries**](docs/GeneralLedgerApi.md#listjournalentries) | **GET** /v1/gl/journal-entries | List journal entries
*GeneralLedgerApi* | [**listPeriods**](docs/GeneralLedgerApi.md#listperiods) | **GET** /v1/gl/periods | List accounting periods
*GeneralLedgerApi* | [**reverseJournalEntry**](docs/GeneralLedgerApi.md#reversejournalentry) | **POST** /v1/gl/journal-entries/{id}/reverse | Reverse a journal entry
*GeneralLedgerApi* | [**updateAccount**](docs/GeneralLedgerApi.md#updateaccount) | **PATCH** /v1/accounts/{id} | Update Account
*InventoryApi* | [**archiveWarehouse**](docs/InventoryApi.md#archivewarehouse) | **DELETE** /v1/inventory/warehouses/{id} | Archive warehouse
*InventoryApi* | [**createStockAdjustment**](docs/InventoryApi.md#createstockadjustment) | **POST** /v1/inventory/adjustments | Create a stock adjustment
*InventoryApi* | [**createStockTransfer**](docs/InventoryApi.md#createstocktransfer) | **POST** /v1/inventory/transfers | Create warehouse transfer
*InventoryApi* | [**createWarehouse**](docs/InventoryApi.md#createwarehouse) | **POST** /v1/inventory/warehouses | Create warehouse
*InventoryApi* | [**getWarehouse**](docs/InventoryApi.md#getwarehouse) | **GET** /v1/inventory/warehouses/{id} | Get warehouse
*InventoryApi* | [**listStock**](docs/InventoryApi.md#liststock) | **GET** /v1/inventory/stock | Stock on hand
*InventoryApi* | [**listStockAdjustments**](docs/InventoryApi.md#liststockadjustments) | **GET** /v1/inventory/adjustments | List stock adjustments
*InventoryApi* | [**listStockMovements**](docs/InventoryApi.md#liststockmovements) | **GET** /v1/inventory/movements | Stock movement ledger
*InventoryApi* | [**listStockTransfers**](docs/InventoryApi.md#liststocktransfers) | **GET** /v1/inventory/transfers | List warehouse transfers
*InventoryApi* | [**listWarehouses**](docs/InventoryApi.md#listwarehouses) | **GET** /v1/inventory/warehouses | List warehouses
*InventoryApi* | [**postStockAdjustment**](docs/InventoryApi.md#poststockadjustment) | **POST** /v1/inventory/adjustments/{id}/post | Post a stock adjustment
*InventoryApi* | [**postStockTransfer**](docs/InventoryApi.md#poststocktransfer) | **POST** /v1/inventory/transfers/{id}/post | Post transfer
*InventoryApi* | [**updateWarehouse**](docs/InventoryApi.md#updatewarehouse) | **PATCH** /v1/inventory/warehouses/{id} | Update warehouse
*NotificationsApi* | [**getNotificationSettings**](docs/NotificationsApi.md#getnotificationsettings) | **GET** /v1/notification-settings | Get notification settings
*NotificationsApi* | [**updateNotificationSettings**](docs/NotificationsApi.md#updatenotificationsettings) | **PATCH** /v1/notification-settings | Update notification settings
*PlansApi* | [**listPlans**](docs/PlansApi.md#listplans) | **GET** /v1/plans | List plans and prices
*PlatformApi* | [**getHealth**](docs/PlatformApi.md#gethealth) | **GET** /v1/health | Health check
*ProductItemsApi* | [**archiveItem**](docs/ProductItemsApi.md#archiveitem) | **DELETE** /v1/items/{id} | Archive Item
*ProductItemsApi* | [**createItem**](docs/ProductItemsApi.md#createitem) | **POST** /v1/items | Create item
*ProductItemsApi* | [**getItem**](docs/ProductItemsApi.md#getitem) | **GET** /v1/items/{id} | Get Item
*ProductItemsApi* | [**listItems**](docs/ProductItemsApi.md#listitems) | **GET** /v1/items | List items
*ProductItemsApi* | [**updateItem**](docs/ProductItemsApi.md#updateitem) | **PATCH** /v1/items/{id} | Update Item
*PurchasingApi* | [**cancelPurchaseOrder**](docs/PurchasingApi.md#cancelpurchaseorder) | **POST** /v1/purchasing/orders/{id}/cancel | Cancel purchase order
*PurchasingApi* | [**cancelPurchaseReturn**](docs/PurchasingApi.md#cancelpurchasereturn) | **POST** /v1/purchasing/returns/{id}/cancel | Cancel purchase return
*PurchasingApi* | [**closePurchaseOrder**](docs/PurchasingApi.md#closepurchaseorder) | **POST** /v1/purchasing/orders/{id}/close | Close purchase order
*PurchasingApi* | [**createBillFromPurchaseOrder**](docs/PurchasingApi.md#createbillfrompurchaseorder) | **POST** /v1/purchasing/orders/{id}/bill | Create a bill from a PO
*PurchasingApi* | [**createBillFromReceipts**](docs/PurchasingApi.md#createbillfromreceipts) | **POST** /v1/purchasing/bills | Create a bill from receipts
*PurchasingApi* | [**createGoodsReceipt**](docs/PurchasingApi.md#creategoodsreceipt) | **POST** /v1/purchasing/receipts | Create goods receipt
*PurchasingApi* | [**createPurchaseOrder**](docs/PurchasingApi.md#createpurchaseorder) | **POST** /v1/purchasing/orders | Create purchase order
*PurchasingApi* | [**createPurchaseReturn**](docs/PurchasingApi.md#createpurchasereturn) | **POST** /v1/purchasing/returns | Create purchase return
*PurchasingApi* | [**getApInvoiceMatch**](docs/PurchasingApi.md#getapinvoicematch) | **GET** /v1/ap/invoices/{id}/match | Three-way match for a bill
*PurchasingApi* | [**getGoodsReceipt**](docs/PurchasingApi.md#getgoodsreceipt) | **GET** /v1/purchasing/receipts/{id} | Get goods receipt
*PurchasingApi* | [**getInvoiceDocument**](docs/PurchasingApi.md#getinvoicedocument) | **GET** /v1/purchasing/invoice-documents/{id} | Get an uploaded invoice file
*PurchasingApi* | [**getPurchaseOrder**](docs/PurchasingApi.md#getpurchaseorder) | **GET** /v1/purchasing/orders/{id} | Get purchase order
*PurchasingApi* | [**getPurchaseReturn**](docs/PurchasingApi.md#getpurchasereturn) | **GET** /v1/purchasing/returns/{id} | Get purchase return
*PurchasingApi* | [**getPurchasingSettings**](docs/PurchasingApi.md#getpurchasingsettings) | **GET** /v1/purchasing/settings | Get purchasing settings
*PurchasingApi* | [**listGoodsReceipts**](docs/PurchasingApi.md#listgoodsreceipts) | **GET** /v1/purchasing/receipts | List goods receipts
*PurchasingApi* | [**listPurchaseOrders**](docs/PurchasingApi.md#listpurchaseorders) | **GET** /v1/purchasing/orders | List purchase orders
*PurchasingApi* | [**listPurchaseReturns**](docs/PurchasingApi.md#listpurchasereturns) | **GET** /v1/purchasing/returns | List purchase returns
*PurchasingApi* | [**postGoodsReceipt**](docs/PurchasingApi.md#postgoodsreceipt) | **POST** /v1/purchasing/receipts/{id}/post | Post goods receipt
*PurchasingApi* | [**postPurchaseReturn**](docs/PurchasingApi.md#postpurchasereturn) | **POST** /v1/purchasing/returns/{id}/post | Post purchase return
*PurchasingApi* | [**submitPurchaseOrder**](docs/PurchasingApi.md#submitpurchaseorder) | **POST** /v1/purchasing/orders/{id}/submit | Submit for approval
*PurchasingApi* | [**updatePurchaseOrder**](docs/PurchasingApi.md#updatepurchaseorder) | **PATCH** /v1/purchasing/orders/{id} | Update purchase order
*PurchasingApi* | [**updatePurchaseReturn**](docs/PurchasingApi.md#updatepurchasereturn) | **PATCH** /v1/purchasing/returns/{id} | Update purchase return
*PurchasingApi* | [**updatePurchasingSettings**](docs/PurchasingApi.md#updatepurchasingsettings) | **PATCH** /v1/purchasing/settings | Update purchasing settings
*PurchasingApi* | [**uploadInvoiceDocument**](docs/PurchasingApi.md#uploadinvoicedocument) | **POST** /v1/purchasing/invoice-documents | Upload a vendor invoice file
*RegionsApi* | [**getRegion**](docs/RegionsApi.md#getregion) | **GET** /v1/regions/{id} | Get a region
*RegionsApi* | [**listRegions**](docs/RegionsApi.md#listregions) | **GET** /v1/regions | List regions
*ReportsApi* | [**getApAging**](docs/ReportsApi.md#getapaging) | **GET** /v1/reports/ap-aging | AP aging
*ReportsApi* | [**getArAging**](docs/ReportsApi.md#getaraging) | **GET** /v1/reports/ar-aging | AR aging
*ReportsApi* | [**getAssetRegister**](docs/ReportsApi.md#getassetregister) | **GET** /v1/reports/asset-register | Asset register report
*ReportsApi* | [**getBalanceSheet**](docs/ReportsApi.md#getbalancesheet) | **GET** /v1/reports/balance-sheet | Balance sheet
*ReportsApi* | [**getBankReconciliationReport**](docs/ReportsApi.md#getbankreconciliationreport) | **GET** /v1/reports/bank-reconciliation | Bank reconciliation report
*ReportsApi* | [**getInventoryValuation**](docs/ReportsApi.md#getinventoryvaluation) | **GET** /v1/reports/inventory-valuation | Inventory valuation
*ReportsApi* | [**getPphWithholdingReport**](docs/ReportsApi.md#getpphwithholdingreport) | **GET** /v1/reports/pph-withholding | Withholding report per period
*ReportsApi* | [**getPpnReport**](docs/ReportsApi.md#getppnreport) | **GET** /v1/reports/ppn | PPN input vs output report
*ReportsApi* | [**getProfitAndLoss**](docs/ReportsApi.md#getprofitandloss) | **GET** /v1/reports/profit-and-loss | Profit and loss
*ReportsApi* | [**getStockCard**](docs/ReportsApi.md#getstockcard) | **GET** /v1/reports/stock-card | Stock card per item
*ReportsApi* | [**getTrialBalance**](docs/ReportsApi.md#gettrialbalance) | **GET** /v1/reports/trial-balance | Trial balance
*RolesAndPermissionsApi* | [**createRole**](docs/RolesAndPermissionsApi.md#createrole) | **POST** /v1/roles | Create a custom role
*RolesAndPermissionsApi* | [**deleteRole**](docs/RolesAndPermissionsApi.md#deleterole) | **DELETE** /v1/roles/{id} | Delete a custom role
*RolesAndPermissionsApi* | [**getRole**](docs/RolesAndPermissionsApi.md#getrole) | **GET** /v1/roles/{id} | Get role
*RolesAndPermissionsApi* | [**getUserPermissions**](docs/RolesAndPermissionsApi.md#getuserpermissions) | **GET** /v1/users/{id}/permissions | Get a user\&#39;s permissions
*RolesAndPermissionsApi* | [**listPermissions**](docs/RolesAndPermissionsApi.md#listpermissions) | **GET** /v1/permissions | List the permission catalogue
*RolesAndPermissionsApi* | [**listRoles**](docs/RolesAndPermissionsApi.md#listroles) | **GET** /v1/roles | List roles and permissions
*RolesAndPermissionsApi* | [**setUserPermissions**](docs/RolesAndPermissionsApi.md#setuserpermissions) | **PUT** /v1/users/{id}/permissions | Set direct user permissions
*RolesAndPermissionsApi* | [**updateRole**](docs/RolesAndPermissionsApi.md#updaterole) | **PATCH** /v1/roles/{id} | Update a custom role
*SalesApi* | [**cancelSalesOrder**](docs/SalesApi.md#cancelsalesorder) | **POST** /v1/sales/orders/{id}/cancel | Cancel sales order
*SalesApi* | [**confirmSalesOrder**](docs/SalesApi.md#confirmsalesorder) | **POST** /v1/sales/orders/{id}/confirm | Confirm sales order
*SalesApi* | [**convertQuotation**](docs/SalesApi.md#convertquotation) | **POST** /v1/sales/quotations/{id}/convert | Convert quotation to order
*SalesApi* | [**createDelivery**](docs/SalesApi.md#createdelivery) | **POST** /v1/sales/deliveries | Create delivery note
*SalesApi* | [**createInvoiceFromSalesOrder**](docs/SalesApi.md#createinvoicefromsalesorder) | **POST** /v1/sales/orders/{id}/invoice | Create invoice from an order
*SalesApi* | [**createQuotation**](docs/SalesApi.md#createquotation) | **POST** /v1/sales/quotations | Create quotation
*SalesApi* | [**createSalesOrder**](docs/SalesApi.md#createsalesorder) | **POST** /v1/sales/orders | Create sales order
*SalesApi* | [**getQuotation**](docs/SalesApi.md#getquotation) | **GET** /v1/sales/quotations/{id} | Get quotation
*SalesApi* | [**getSalesOrder**](docs/SalesApi.md#getsalesorder) | **GET** /v1/sales/orders/{id} | Get sales order
*SalesApi* | [**listDeliveries**](docs/SalesApi.md#listdeliveries) | **GET** /v1/sales/deliveries | List delivery notes
*SalesApi* | [**listQuotations**](docs/SalesApi.md#listquotations) | **GET** /v1/sales/quotations | List quotations
*SalesApi* | [**listSalesOrders**](docs/SalesApi.md#listsalesorders) | **GET** /v1/sales/orders | List sales orders
*SalesApi* | [**postDelivery**](docs/SalesApi.md#postdelivery) | **POST** /v1/sales/deliveries/{id}/post | Post delivery
*SalesApi* | [**updateQuotation**](docs/SalesApi.md#updatequotation) | **PATCH** /v1/sales/quotations/{id} | Update quotation
*SalesApi* | [**updateSalesOrder**](docs/SalesApi.md#updatesalesorder) | **PATCH** /v1/sales/orders/{id} | Update sales order
*TaxApi* | [**createTaxExport**](docs/TaxApi.md#createtaxexport) | **POST** /v1/tax/exports | Generate a tax export file
*TaxApi* | [**createTaxWithholding**](docs/TaxApi.md#createtaxwithholding) | **POST** /v1/tax/withholdings | Record PPh 23 withholding
*TaxApi* | [**getTaxExport**](docs/TaxApi.md#gettaxexport) | **GET** /v1/tax/exports/{id} | Get tax export status
*TaxApi* | [**getTaxInvoice**](docs/TaxApi.md#gettaxinvoice) | **GET** /v1/tax/invoices/{id} | Get tax invoice
*TaxApi* | [**getTaxSettings**](docs/TaxApi.md#gettaxsettings) | **GET** /v1/tax/settings | Get tenant tax profile
*TaxApi* | [**listTaxInvoices**](docs/TaxApi.md#listtaxinvoices) | **GET** /v1/tax/invoices | List tax invoices
*TaxApi* | [**listTaxWithholdings**](docs/TaxApi.md#listtaxwithholdings) | **GET** /v1/tax/withholdings | List PPh 23 withholdings
*TaxApi* | [**updateTaxInvoice**](docs/TaxApi.md#updatetaxinvoice) | **PATCH** /v1/tax/invoices/{id} | Record tax invoice number
*TaxApi* | [**updateTaxSettings**](docs/TaxApi.md#updatetaxsettings) | **PATCH** /v1/tax/settings | Update tenant tax profile
*TaxAndCurrenciesApi* | [**archiveTaxRate**](docs/TaxAndCurrenciesApi.md#archivetaxrate) | **DELETE** /v1/tax-rates/{id} | Archive TaxRate
*TaxAndCurrenciesApi* | [**createTaxRate**](docs/TaxAndCurrenciesApi.md#createtaxrate) | **POST** /v1/tax-rates | Create tax rate
*TaxAndCurrenciesApi* | [**getTaxRate**](docs/TaxAndCurrenciesApi.md#gettaxrate) | **GET** /v1/tax-rates/{id} | Get TaxRate
*TaxAndCurrenciesApi* | [**listCurrencies**](docs/TaxAndCurrenciesApi.md#listcurrencies) | **GET** /v1/currencies | List supported currencies
*TaxAndCurrenciesApi* | [**listTaxRates**](docs/TaxAndCurrenciesApi.md#listtaxrates) | **GET** /v1/tax-rates | List tax rates
*TaxAndCurrenciesApi* | [**updateTaxRate**](docs/TaxAndCurrenciesApi.md#updatetaxrate) | **PATCH** /v1/tax-rates/{id} | Update TaxRate
*TenantApi* | [**listMyTenants**](docs/TenantApi.md#listmytenants) | **GET** /v1/auth/tenants | List tenants you belong to
*TenantApi* | [**switchTenant**](docs/TenantApi.md#switchtenant) | **POST** /v1/auth/switch-tenant | Switch the active tenant
*TenantsApi* | [**createTenant**](docs/TenantsApi.md#createtenant) | **POST** /v1/tenants | Create a tenant
*TenantsApi* | [**getTenant**](docs/TenantsApi.md#gettenant) | **GET** /v1/tenant | Get current tenant
*TenantsApi* | [**updateTenant**](docs/TenantsApi.md#updatetenant) | **PATCH** /v1/tenant | Update tenant settings
*UsersApi* | [**createUser**](docs/UsersApi.md#createuser) | **POST** /v1/users | Create user
*UsersApi* | [**deactivateUser**](docs/UsersApi.md#deactivateuser) | **DELETE** /v1/users/{id} | Deactivate User
*UsersApi* | [**getUser**](docs/UsersApi.md#getuser) | **GET** /v1/users/{id} | Get User
*UsersApi* | [**listUsers**](docs/UsersApi.md#listusers) | **GET** /v1/users | List users
*UsersApi* | [**updateUser**](docs/UsersApi.md#updateuser) | **PATCH** /v1/users/{id} | Update User
*VendorsApi* | [**archiveVendor**](docs/VendorsApi.md#archivevendor) | **DELETE** /v1/vendors/{id} | Archive Vendor
*VendorsApi* | [**createVendor**](docs/VendorsApi.md#createvendor) | **POST** /v1/vendors | Create vendor
*VendorsApi* | [**getVendor**](docs/VendorsApi.md#getvendor) | **GET** /v1/vendors/{id} | Get Vendor
*VendorsApi* | [**listVendors**](docs/VendorsApi.md#listvendors) | **GET** /v1/vendors | List vendors
*VendorsApi* | [**updateVendor**](docs/VendorsApi.md#updatevendor) | **PATCH** /v1/vendors/{id} | Update Vendor
*WebhooksApi* | [**createWebhook**](docs/WebhooksApi.md#createwebhook) | **POST** /v1/webhooks | Register a webhook endpoint
*WebhooksApi* | [**deleteWebhook**](docs/WebhooksApi.md#deletewebhook) | **DELETE** /v1/webhooks/{id} | Remove webhook endpoint
*WebhooksApi* | [**getWebhook**](docs/WebhooksApi.md#getwebhook) | **GET** /v1/webhooks/{id} | Get webhook endpoint
*WebhooksApi* | [**listWebhookDeliveries**](docs/WebhooksApi.md#listwebhookdeliveries) | **GET** /v1/webhooks/{id}/deliveries | List deliveries
*WebhooksApi* | [**listWebhookEventTypes**](docs/WebhooksApi.md#listwebhookeventtypes) | **GET** /v1/webhook-event-types | List event types
*WebhooksApi* | [**listWebhooks**](docs/WebhooksApi.md#listwebhooks) | **GET** /v1/webhooks | List webhook endpoints
*WebhooksApi* | [**rotateWebhookSecret**](docs/WebhooksApi.md#rotatewebhooksecret) | **POST** /v1/webhooks/{id}/rotate-secret | Rotate signing secret
*WebhooksApi* | [**testWebhook**](docs/WebhooksApi.md#testwebhook) | **POST** /v1/webhooks/{id}/test | Send a test event
*WebhooksApi* | [**updateWebhook**](docs/WebhooksApi.md#updatewebhook) | **PATCH** /v1/webhooks/{id} | Update webhook endpoint


### Models

- [AcceptInviteInput](docs/AcceptInviteInput.md)
- [Account](docs/Account.md)
- [AccountInput](docs/AccountInput.md)
- [AccountListResponse](docs/AccountListResponse.md)
- [AccountResponse](docs/AccountResponse.md)
- [AccountUpdate](docs/AccountUpdate.md)
- [Address](docs/Address.md)
- [AgingReport](docs/AgingReport.md)
- [AgingReportResponse](docs/AgingReportResponse.md)
- [AgingReportRowsInner](docs/AgingReportRowsInner.md)
- [AgingReportTotals](docs/AgingReportTotals.md)
- [AllocationsInput](docs/AllocationsInput.md)
- [ApCreditNote](docs/ApCreditNote.md)
- [ApCreditNoteInput](docs/ApCreditNoteInput.md)
- [ApCreditNoteListResponse](docs/ApCreditNoteListResponse.md)
- [ApCreditNoteRefund](docs/ApCreditNoteRefund.md)
- [ApCreditNoteRefundInput](docs/ApCreditNoteRefundInput.md)
- [ApCreditNoteResponse](docs/ApCreditNoteResponse.md)
- [ApCreditNoteUpdate](docs/ApCreditNoteUpdate.md)
- [ApInvoice](docs/ApInvoice.md)
- [ApInvoiceInput](docs/ApInvoiceInput.md)
- [ApInvoiceListResponse](docs/ApInvoiceListResponse.md)
- [ApInvoiceResponse](docs/ApInvoiceResponse.md)
- [ApInvoiceUpdate](docs/ApInvoiceUpdate.md)
- [ApPayment](docs/ApPayment.md)
- [ApPaymentInput](docs/ApPaymentInput.md)
- [ApPaymentListResponse](docs/ApPaymentListResponse.md)
- [ApPaymentResponse](docs/ApPaymentResponse.md)
- [ApiKey](docs/ApiKey.md)
- [ApiKeyInput](docs/ApiKeyInput.md)
- [ApiKeyListResponse](docs/ApiKeyListResponse.md)
- [ApiKeyWithSecret](docs/ApiKeyWithSecret.md)
- [ApiKeyWithSecretResponse](docs/ApiKeyWithSecretResponse.md)
- [ApiPlan](docs/ApiPlan.md)
- [ApiPlanChange](docs/ApiPlanChange.md)
- [ApiPlanChangeInput](docs/ApiPlanChangeInput.md)
- [ApiPlanChangeResponse](docs/ApiPlanChangeResponse.md)
- [ApiPlanListResponse](docs/ApiPlanListResponse.md)
- [Approval](docs/Approval.md)
- [ApprovalDecisionInput](docs/ApprovalDecisionInput.md)
- [ApprovalListResponse](docs/ApprovalListResponse.md)
- [ApprovalRejectInput](docs/ApprovalRejectInput.md)
- [ApprovalResponse](docs/ApprovalResponse.md)
- [ApprovalRule](docs/ApprovalRule.md)
- [ApprovalRuleInput](docs/ApprovalRuleInput.md)
- [ApprovalRuleListResponse](docs/ApprovalRuleListResponse.md)
- [ApprovalRuleResponse](docs/ApprovalRuleResponse.md)
- [ApprovalRuleUpdate](docs/ApprovalRuleUpdate.md)
- [ArInvoice](docs/ArInvoice.md)
- [ArInvoiceInput](docs/ArInvoiceInput.md)
- [ArInvoiceListResponse](docs/ArInvoiceListResponse.md)
- [ArInvoiceResponse](docs/ArInvoiceResponse.md)
- [ArInvoiceUpdate](docs/ArInvoiceUpdate.md)
- [ArPayment](docs/ArPayment.md)
- [ArPaymentInput](docs/ArPaymentInput.md)
- [ArPaymentListResponse](docs/ArPaymentListResponse.md)
- [ArPaymentResponse](docs/ArPaymentResponse.md)
- [Asset](docs/Asset.md)
- [AssetCategory](docs/AssetCategory.md)
- [AssetCategoryInput](docs/AssetCategoryInput.md)
- [AssetCategoryListResponse](docs/AssetCategoryListResponse.md)
- [AssetCategoryResponse](docs/AssetCategoryResponse.md)
- [AssetCategoryUpdate](docs/AssetCategoryUpdate.md)
- [AssetDisposal](docs/AssetDisposal.md)
- [AssetDisposeInput](docs/AssetDisposeInput.md)
- [AssetFromBillInput](docs/AssetFromBillInput.md)
- [AssetInput](docs/AssetInput.md)
- [AssetListResponse](docs/AssetListResponse.md)
- [AssetRegister](docs/AssetRegister.md)
- [AssetRegisterLinesInner](docs/AssetRegisterLinesInner.md)
- [AssetRegisterResponse](docs/AssetRegisterResponse.md)
- [AssetResponse](docs/AssetResponse.md)
- [AssetUpdate](docs/AssetUpdate.md)
- [AuthAccount](docs/AuthAccount.md)
- [AuthUser](docs/AuthUser.md)
- [BalanceSheet](docs/BalanceSheet.md)
- [BalanceSheetResponse](docs/BalanceSheetResponse.md)
- [BankAccount](docs/BankAccount.md)
- [BankAccountInput](docs/BankAccountInput.md)
- [BankAccountListResponse](docs/BankAccountListResponse.md)
- [BankAccountResponse](docs/BankAccountResponse.md)
- [BankAccountUpdate](docs/BankAccountUpdate.md)
- [BankMatch](docs/BankMatch.md)
- [BankMatchInput](docs/BankMatchInput.md)
- [BankMatchTarget](docs/BankMatchTarget.md)
- [BankReconciliation](docs/BankReconciliation.md)
- [BankReconciliationInput](docs/BankReconciliationInput.md)
- [BankReconciliationListResponse](docs/BankReconciliationListResponse.md)
- [BankReconciliationReport](docs/BankReconciliationReport.md)
- [BankReconciliationReportResponse](docs/BankReconciliationReportResponse.md)
- [BankReconciliationReportUnreconciledBookItemsInner](docs/BankReconciliationReportUnreconciledBookItemsInner.md)
- [BankReconciliationResponse](docs/BankReconciliationResponse.md)
- [BankStatement](docs/BankStatement.md)
- [BankStatementLine](docs/BankStatementLine.md)
- [BankStatementLineListResponse](docs/BankStatementLineListResponse.md)
- [BankStatementLineResponse](docs/BankStatementLineResponse.md)
- [BankStatementResponse](docs/BankStatementResponse.md)
- [BillFromPurchaseOrderInput](docs/BillFromPurchaseOrderInput.md)
- [BillFromReceiptsInput](docs/BillFromReceiptsInput.md)
- [BillingInvoice](docs/BillingInvoice.md)
- [BillingInvoiceDetail](docs/BillingInvoiceDetail.md)
- [BillingInvoiceDetailResponse](docs/BillingInvoiceDetailResponse.md)
- [BillingInvoiceLine](docs/BillingInvoiceLine.md)
- [BillingInvoiceListResponse](docs/BillingInvoiceListResponse.md)
- [BillingPayment](docs/BillingPayment.md)
- [BillingPaymentListResponse](docs/BillingPaymentListResponse.md)
- [BusinessPartner](docs/BusinessPartner.md)
- [ChangePasswordInput](docs/ChangePasswordInput.md)
- [Checkout](docs/Checkout.md)
- [CheckoutInput](docs/CheckoutInput.md)
- [CheckoutResponse](docs/CheckoutResponse.md)
- [Currency](docs/Currency.md)
- [CurrencyListResponse](docs/CurrencyListResponse.md)
- [CursorListMeta](docs/CursorListMeta.md)
- [CursorPagination](docs/CursorPagination.md)
- [CustomerInput](docs/CustomerInput.md)
- [CustomerListResponse](docs/CustomerListResponse.md)
- [CustomerResponse](docs/CustomerResponse.md)
- [CustomerUpdate](docs/CustomerUpdate.md)
- [Delivery](docs/Delivery.md)
- [DeliveryInput](docs/DeliveryInput.md)
- [DeliveryInputLinesInner](docs/DeliveryInputLinesInner.md)
- [DeliveryLinesInner](docs/DeliveryLinesInner.md)
- [DeliveryListResponse](docs/DeliveryListResponse.md)
- [DeliveryResponse](docs/DeliveryResponse.md)
- [DepreciationRun](docs/DepreciationRun.md)
- [DepreciationRunInput](docs/DepreciationRunInput.md)
- [DepreciationRunLinesInner](docs/DepreciationRunLinesInner.md)
- [DepreciationRunResponse](docs/DepreciationRunResponse.md)
- [DepreciationSchedule](docs/DepreciationSchedule.md)
- [DepreciationScheduleLinesInner](docs/DepreciationScheduleLinesInner.md)
- [DepreciationScheduleResponse](docs/DepreciationScheduleResponse.md)
- [ErrorError](docs/ErrorError.md)
- [ForgotPasswordInput](docs/ForgotPasswordInput.md)
- [GoodsReceipt](docs/GoodsReceipt.md)
- [GoodsReceiptInput](docs/GoodsReceiptInput.md)
- [GoodsReceiptInputLinesInner](docs/GoodsReceiptInputLinesInner.md)
- [GoodsReceiptLine](docs/GoodsReceiptLine.md)
- [GoodsReceiptListResponse](docs/GoodsReceiptListResponse.md)
- [GoodsReceiptResponse](docs/GoodsReceiptResponse.md)
- [Health](docs/Health.md)
- [HealthResponse](docs/HealthResponse.md)
- [InventoryValuation](docs/InventoryValuation.md)
- [InventoryValuationResponse](docs/InventoryValuationResponse.md)
- [InvoiceDocument](docs/InvoiceDocument.md)
- [InvoiceDocumentResponse](docs/InvoiceDocumentResponse.md)
- [InvoiceFromSalesOrderInput](docs/InvoiceFromSalesOrderInput.md)
- [InvoiceLine](docs/InvoiceLine.md)
- [InvoiceLineInput](docs/InvoiceLineInput.md)
- [Item](docs/Item.md)
- [ItemInput](docs/ItemInput.md)
- [ItemListResponse](docs/ItemListResponse.md)
- [ItemResponse](docs/ItemResponse.md)
- [ItemUpdate](docs/ItemUpdate.md)
- [JournalEntry](docs/JournalEntry.md)
- [JournalEntryInput](docs/JournalEntryInput.md)
- [JournalEntryListResponse](docs/JournalEntryListResponse.md)
- [JournalEntryResponse](docs/JournalEntryResponse.md)
- [JournalLine](docs/JournalLine.md)
- [LoginInput](docs/LoginInput.md)
- [LoginResult](docs/LoginResult.md)
- [LoginResultResponse](docs/LoginResultResponse.md)
- [Me](docs/Me.md)
- [MeResponse](docs/MeResponse.md)
- [Membership](docs/Membership.md)
- [MembershipListResponse](docs/MembershipListResponse.md)
- [ModelError](docs/ModelError.md)
- [Money](docs/Money.md)
- [NotificationSettings](docs/NotificationSettings.md)
- [NotificationSettingsResponse](docs/NotificationSettingsResponse.md)
- [NotificationSettingsUpdate](docs/NotificationSettingsUpdate.md)
- [PageListMeta](docs/PageListMeta.md)
- [PagePagination](docs/PagePagination.md)
- [PaymentAllocation](docs/PaymentAllocation.md)
- [Period](docs/Period.md)
- [PeriodListResponse](docs/PeriodListResponse.md)
- [PeriodResponse](docs/PeriodResponse.md)
- [Permission](docs/Permission.md)
- [PermissionListResponse](docs/PermissionListResponse.md)
- [Plan](docs/Plan.md)
- [PlanListResponse](docs/PlanListResponse.md)
- [PlanPrice](docs/PlanPrice.md)
- [PpnReport](docs/PpnReport.md)
- [PpnReportLinesInner](docs/PpnReportLinesInner.md)
- [PpnReportResponse](docs/PpnReportResponse.md)
- [ProfitAndLoss](docs/ProfitAndLoss.md)
- [ProfitAndLossResponse](docs/ProfitAndLossResponse.md)
- [PurchaseOrder](docs/PurchaseOrder.md)
- [PurchaseOrderInput](docs/PurchaseOrderInput.md)
- [PurchaseOrderLine](docs/PurchaseOrderLine.md)
- [PurchaseOrderListResponse](docs/PurchaseOrderListResponse.md)
- [PurchaseOrderResponse](docs/PurchaseOrderResponse.md)
- [PurchaseOrderUpdate](docs/PurchaseOrderUpdate.md)
- [PurchaseReturn](docs/PurchaseReturn.md)
- [PurchaseReturnInput](docs/PurchaseReturnInput.md)
- [PurchaseReturnInputLinesInner](docs/PurchaseReturnInputLinesInner.md)
- [PurchaseReturnLine](docs/PurchaseReturnLine.md)
- [PurchaseReturnListResponse](docs/PurchaseReturnListResponse.md)
- [PurchaseReturnResponse](docs/PurchaseReturnResponse.md)
- [PurchaseReturnUpdate](docs/PurchaseReturnUpdate.md)
- [PurchasingSettings](docs/PurchasingSettings.md)
- [PurchasingSettingsResponse](docs/PurchasingSettingsResponse.md)
- [PurchasingSettingsUpdate](docs/PurchasingSettingsUpdate.md)
- [Quotation](docs/Quotation.md)
- [QuotationInput](docs/QuotationInput.md)
- [QuotationListResponse](docs/QuotationListResponse.md)
- [QuotationResponse](docs/QuotationResponse.md)
- [QuotationUpdate](docs/QuotationUpdate.md)
- [RefreshInput](docs/RefreshInput.md)
- [Region](docs/Region.md)
- [RegionListResponse](docs/RegionListResponse.md)
- [RegionResponse](docs/RegionResponse.md)
- [RegisterInput](docs/RegisterInput.md)
- [RegistrationLoginAction](docs/RegistrationLoginAction.md)
- [RegistrationMeta](docs/RegistrationMeta.md)
- [RegistrationResponse](docs/RegistrationResponse.md)
- [ReportSection](docs/ReportSection.md)
- [ReportSectionRowsInner](docs/ReportSectionRowsInner.md)
- [ResetPasswordInput](docs/ResetPasswordInput.md)
- [Role](docs/Role.md)
- [RoleInput](docs/RoleInput.md)
- [RoleListResponse](docs/RoleListResponse.md)
- [RoleResponse](docs/RoleResponse.md)
- [RoleUpdate](docs/RoleUpdate.md)
- [SalesOrder](docs/SalesOrder.md)
- [SalesOrderInput](docs/SalesOrderInput.md)
- [SalesOrderLine](docs/SalesOrderLine.md)
- [SalesOrderListResponse](docs/SalesOrderListResponse.md)
- [SalesOrderResponse](docs/SalesOrderResponse.md)
- [SalesOrderUpdate](docs/SalesOrderUpdate.md)
- [StockAdjustment](docs/StockAdjustment.md)
- [StockAdjustmentInput](docs/StockAdjustmentInput.md)
- [StockAdjustmentInputLinesInner](docs/StockAdjustmentInputLinesInner.md)
- [StockAdjustmentLinesInner](docs/StockAdjustmentLinesInner.md)
- [StockAdjustmentListResponse](docs/StockAdjustmentListResponse.md)
- [StockAdjustmentResponse](docs/StockAdjustmentResponse.md)
- [StockCard](docs/StockCard.md)
- [StockCardResponse](docs/StockCardResponse.md)
- [StockLevel](docs/StockLevel.md)
- [StockLevelListResponse](docs/StockLevelListResponse.md)
- [StockMovement](docs/StockMovement.md)
- [StockMovementListResponse](docs/StockMovementListResponse.md)
- [StockTransfer](docs/StockTransfer.md)
- [StockTransferInput](docs/StockTransferInput.md)
- [StockTransferLinesInner](docs/StockTransferLinesInner.md)
- [StockTransferListResponse](docs/StockTransferListResponse.md)
- [StockTransferResponse](docs/StockTransferResponse.md)
- [SubscribeInput](docs/SubscribeInput.md)
- [Subscription](docs/Subscription.md)
- [SubscriptionResponse](docs/SubscriptionResponse.md)
- [SubscriptionUpdate](docs/SubscriptionUpdate.md)
- [SwitchTenantInput](docs/SwitchTenantInput.md)
- [SwitchTenantResponse](docs/SwitchTenantResponse.md)
- [TaxExport](docs/TaxExport.md)
- [TaxExportInput](docs/TaxExportInput.md)
- [TaxExportResponse](docs/TaxExportResponse.md)
- [TaxInvoice](docs/TaxInvoice.md)
- [TaxInvoiceListResponse](docs/TaxInvoiceListResponse.md)
- [TaxInvoiceResponse](docs/TaxInvoiceResponse.md)
- [TaxInvoiceUpdate](docs/TaxInvoiceUpdate.md)
- [TaxRate](docs/TaxRate.md)
- [TaxRateInput](docs/TaxRateInput.md)
- [TaxRateListResponse](docs/TaxRateListResponse.md)
- [TaxRateResponse](docs/TaxRateResponse.md)
- [TaxRateUpdate](docs/TaxRateUpdate.md)
- [TaxSettings](docs/TaxSettings.md)
- [TaxSettingsResponse](docs/TaxSettingsResponse.md)
- [TaxSettingsUpdate](docs/TaxSettingsUpdate.md)
- [TaxWithholding](docs/TaxWithholding.md)
- [TaxWithholdingInput](docs/TaxWithholdingInput.md)
- [TaxWithholdingListResponse](docs/TaxWithholdingListResponse.md)
- [TaxWithholdingResponse](docs/TaxWithholdingResponse.md)
- [Tenant](docs/Tenant.md)
- [TenantCreateResponse](docs/TenantCreateResponse.md)
- [TenantInput](docs/TenantInput.md)
- [TenantResponse](docs/TenantResponse.md)
- [TenantSession](docs/TenantSession.md)
- [TenantSummary](docs/TenantSummary.md)
- [TenantUpdate](docs/TenantUpdate.md)
- [ThreeWayMatch](docs/ThreeWayMatch.md)
- [ThreeWayMatchLinesInner](docs/ThreeWayMatchLinesInner.md)
- [ThreeWayMatchResponse](docs/ThreeWayMatchResponse.md)
- [TokenPair](docs/TokenPair.md)
- [TokenPairResponse](docs/TokenPairResponse.md)
- [TrialBalance](docs/TrialBalance.md)
- [TrialBalanceResponse](docs/TrialBalanceResponse.md)
- [TrialBalanceRowsInner](docs/TrialBalanceRowsInner.md)
- [Usage](docs/Usage.md)
- [UsageAlertSettings](docs/UsageAlertSettings.md)
- [UsageAlertSettingsResponse](docs/UsageAlertSettingsResponse.md)
- [UsageAlertSettingsUpdate](docs/UsageAlertSettingsUpdate.md)
- [UsagePeriod](docs/UsagePeriod.md)
- [UsagePeriodListResponse](docs/UsagePeriodListResponse.md)
- [UsageRateLimit](docs/UsageRateLimit.md)
- [UsageResponse](docs/UsageResponse.md)
- [UsageSummary](docs/UsageSummary.md)
- [UsageSummaryBreakdownInner](docs/UsageSummaryBreakdownInner.md)
- [UsageSummaryResponse](docs/UsageSummaryResponse.md)
- [User](docs/User.md)
- [UserInput](docs/UserInput.md)
- [UserListResponse](docs/UserListResponse.md)
- [UserPermissionGrant](docs/UserPermissionGrant.md)
- [UserPermissions](docs/UserPermissions.md)
- [UserPermissionsInput](docs/UserPermissionsInput.md)
- [UserPermissionsInputGrantsInner](docs/UserPermissionsInputGrantsInner.md)
- [UserPermissionsResponse](docs/UserPermissionsResponse.md)
- [UserResponse](docs/UserResponse.md)
- [UserUpdate](docs/UserUpdate.md)
- [VendorInput](docs/VendorInput.md)
- [VendorListResponse](docs/VendorListResponse.md)
- [VendorResponse](docs/VendorResponse.md)
- [VendorUpdate](docs/VendorUpdate.md)
- [VerifyEmailInput](docs/VerifyEmailInput.md)
- [VerifyEmailMeta](docs/VerifyEmailMeta.md)
- [VerifyEmailResponse](docs/VerifyEmailResponse.md)
- [Warehouse](docs/Warehouse.md)
- [WarehouseInput](docs/WarehouseInput.md)
- [WarehouseListResponse](docs/WarehouseListResponse.md)
- [WarehouseResponse](docs/WarehouseResponse.md)
- [WarehouseUpdate](docs/WarehouseUpdate.md)
- [Webhook](docs/Webhook.md)
- [WebhookDelivery](docs/WebhookDelivery.md)
- [WebhookDeliveryListResponse](docs/WebhookDeliveryListResponse.md)
- [WebhookDeliveryResponse](docs/WebhookDeliveryResponse.md)
- [WebhookEventType](docs/WebhookEventType.md)
- [WebhookEventTypeListResponse](docs/WebhookEventTypeListResponse.md)
- [WebhookInput](docs/WebhookInput.md)
- [WebhookListResponse](docs/WebhookListResponse.md)
- [WebhookResponse](docs/WebhookResponse.md)
- [WebhookTestInput](docs/WebhookTestInput.md)
- [WebhookUpdate](docs/WebhookUpdate.md)
- [WebhookWithSecret](docs/WebhookWithSecret.md)
- [WebhookWithSecretResponse](docs/WebhookWithSecretResponse.md)
- [WithholdingReport](docs/WithholdingReport.md)
- [WithholdingReportLinesInner](docs/WithholdingReportLinesInner.md)
- [WithholdingReportResponse](docs/WithholdingReportResponse.md)

### Authorization


Authentication schemes defined for the API:
<a id="UserJWT"></a>
#### UserJWT


- **Type**: HTTP Bearer Token authentication (JWT)
<a id="ApiKeyAuth"></a>
#### ApiKeyAuth


- **Type**: HTTP Bearer Token authentication

## About

This TypeScript SDK client supports the [Fetch API](https://fetch.spec.whatwg.org/)
and is automatically generated by the
[OpenAPI Generator](https://openapi-generator.tech) project:

- API version: `1.0.0-draft`
- Package version: `1.0.0`
- Generator version: `7.26.0`
- Build package: `org.openapitools.codegen.languages.TypeScriptFetchClientCodegen`

The generated npm module supports the following:

- Environments
  * Node.js
  * Webpack
  * Browserify
- Language levels
  * ES5 - you must have a Promises/A+ library installed
  * ES6
- Module systems
  * CommonJS
  * ES6 module system


## Development

### Building

To build the TypeScript source code, you need to have Node.js and npm installed.
After cloning the repository, navigate to the project directory and run:

```bash
npm install
npm run build
```

### Publishing

Once you've built the package, you can publish it to npm:

```bash
npm publish
```

## License

[]()
