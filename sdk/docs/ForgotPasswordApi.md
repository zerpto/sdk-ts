# ForgotPasswordApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**forgotPassword**](ForgotPasswordApi.md#forgotpassword) | **POST** /v1/auth/reset-password | Send a password reset email |
| [**resetPassword**](ForgotPasswordApi.md#resetpassword) | **PUT** /v1/auth/reset-password | Reset password using a token |



## forgotPassword

> forgotPassword(forgotPasswordInput)

Send a password reset email

Sends a password reset email to the given address when an account exists for it. Use it when a person cannot remember their password. It always answers 202 Accepted, whether or not the email has an account, so nobody can use this endpoint to find out which email addresses are registered with Zerpto.  The link in the email carries the token that [&#x60;PUT /v1/auth/reset-password&#x60;](#tag/forgot-password/PUT/v1/auth/reset-password) needs.  Error codes: none specific.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  ForgotPasswordApi,
} from '@zerpto/sdk';
import type { ForgotPasswordRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new ForgotPasswordApi();

  const body = {
    // ForgotPasswordInput
    forgotPasswordInput: ...,
  } satisfies ForgotPasswordRequest;

  try {
    const data = await api.forgotPassword(body);
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
| **forgotPasswordInput** | [ForgotPasswordInput](ForgotPasswordInput.md) |  | |

### Return type

`void` (Empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **202** | Accepted |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## resetPassword

> resetPassword(resetPasswordInput)

Reset password using a token

Sets a new password using the token from the reset email. Use it when the person opens the link in that email and chooses a new password. Every session the user has is revoked at the same time, on all devices, so anyone who had access with the old password is signed out and must log in again.  The token comes from the email sent by [&#x60;POST /v1/auth/reset-password&#x60;](#tag/forgot-password/POST/v1/auth/reset-password). Afterwards the user logs in again with [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in).  Error codes: &#x60;invalid_token&#x60;, &#x60;token_expired&#x60;, &#x60;weak_password&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  ForgotPasswordApi,
} from '@zerpto/sdk';
import type { ResetPasswordRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new ForgotPasswordApi();

  const body = {
    // ResetPasswordInput
    resetPasswordInput: ...,
  } satisfies ResetPasswordRequest;

  try {
    const data = await api.resetPassword(body);
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
| **resetPasswordInput** | [ResetPasswordInput](ResetPasswordInput.md) |  | |

### Return type

`void` (Empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Password changed |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

