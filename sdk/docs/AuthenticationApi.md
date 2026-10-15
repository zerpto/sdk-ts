# AuthenticationApi

All URIs are relative to *https://api.zerpto.com*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**acceptInvite**](AuthenticationApi.md#acceptinvite) | **POST** /v1/auth/accept-invite | Accept invite, create account |
| [**changePassword**](AuthenticationApi.md#changepassword) | **PUT** /v1/auth/password | Change your password |
| [**getMe**](AuthenticationApi.md#getme) | **GET** /v1/auth/me | Current user and permissions |
| [**login**](AuthenticationApi.md#login) | **POST** /v1/auth/sign-in | Log in with email, password |
| [**logout**](AuthenticationApi.md#logout) | **DELETE** /v1/auth/sign-out | Log out of the session |
| [**refreshToken**](AuthenticationApi.md#refreshtoken) | **POST** /v1/auth/refresh | Refresh the access token |
| [**register**](AuthenticationApi.md#register) | **POST** /v1/auth/sign-up | Register a new account |
| [**verifyEmail**](AuthenticationApi.md#verifyemail) | **POST** /v1/auth/verify-email | Confirm an email address |



## acceptInvite

> LoginResultResponse acceptInvite(acceptInviteInput)

Accept invite, create account

Creates an account from an invitation and signs the new user in. Use it when someone opens the link in an invitation email and chooses a password. The person joins the tenant that invited them, with the roles chosen in the invitation, and gets tokens in the response, so no separate login call is needed.  The token comes from the invitation email sent by [&#x60;POST /v1/users&#x60;](#tag/platform/POST/v1/users). The new user lands in the tenant that invited them, with the roles chosen in the invitation.  Error codes: &#x60;invalid_token&#x60;, &#x60;token_expired&#x60;, &#x60;weak_password&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { AcceptInviteRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new AuthenticationApi();

  const body = {
    // AcceptInviteInput
    acceptInviteInput: ...,
  } satisfies AcceptInviteRequest;

  try {
    const data = await api.acceptInvite(body);
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
| **acceptInviteInput** | [AcceptInviteInput](AcceptInviteInput.md) |  | |

### Return type

[**LoginResultResponse**](LoginResultResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Account created and logged in |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## changePassword

> changePassword(changePasswordInput)

Change your password

Changes the password of the person who is signed in, after they confirm the current one. Use it from the account settings page when the person knows their password and simply wants to choose a new one. If they have forgotten it, they should use the password reset flow, which needs only access to their email.  If the user forgot the current password, they use [&#x60;POST /v1/auth/reset-password&#x60;](#tag/forgot-password/POST/v1/auth/reset-password) and [&#x60;PUT /v1/auth/reset-password&#x60;](#tag/forgot-password/PUT/v1/auth/reset-password) instead.  Error codes: &#x60;invalid_credentials&#x60; (wrong current password), &#x60;weak_password&#x60;.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { ChangePasswordRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuthenticationApi(config);

  const body = {
    // ChangePasswordInput
    changePasswordInput: ...,
  } satisfies ChangePasswordRequest;

  try {
    const data = await api.changePassword(body);
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
| **changePasswordInput** | [ChangePasswordInput](ChangePasswordInput.md) |  | |

### Return type

`void` (Empty response body)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Password changed |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## getMe

> MeResponse getMe()

Current user and permissions

Returns the person who is signed in, together with their roles and their effective permissions in the current tenant. Use it when the web app starts, to decide which menus and buttons to show. The permissions are the sum of the user\&#39;s roles and any permissions granted to them directly.  Roles are managed with the role endpoints, starting at [&#x60;GET /v1/roles&#x60;](#tag/platform/GET/v1/roles), and a user\&#39;s direct permissions with [&#x60;PUT /v1/users/{id}/permissions&#x60;](#tag/platform/PUT/v1/users/{id}/permissions). Switching tenant with [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/tenant/POST/v1/auth/switch-tenant) changes what this returns.  Error codes: none specific.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { GetMeRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuthenticationApi(config);

  try {
    const data = await api.getMe();
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

[**MeResponse**](MeResponse.md)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Success |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## login

> LoginResultResponse login(loginInput)

Log in with email, password

Exchanges an email address and password for an access token and a refresh token. Use it when a person signs in to the web app. The tokens are for the tenant the person used last, or for their only tenant. The response also includes the user and the tenant, so the app can show who is signed in straight away.  The account must have its email confirmed with [&#x60;POST /v1/auth/verify-email&#x60;](#tag/authentication/POST/v1/auth/verify-email) first. To change tenant afterwards, use [&#x60;GET /v1/auth/tenants&#x60;](#tag/tenant/GET/v1/auth/tenants) and [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/tenant/POST/v1/auth/switch-tenant).  Error codes: &#x60;invalid_credentials&#x60;, &#x60;account_deactivated&#x60;, &#x60;account_locked&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { LoginRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new AuthenticationApi();

  const body = {
    // LoginInput
    loginInput: ...,
  } satisfies LoginRequest;

  try {
    const data = await api.login(body);
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
| **loginInput** | [LoginInput](LoginInput.md) |  | |

### Return type

[**LoginResultResponse**](LoginResultResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Logged in |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## logout

> logout()

Log out of the session

Ends the current session by revoking its refresh token. Use it when a person signs out of the web app, so the session cannot be renewed afterwards. The session is identified by the access token you send, so the request has no body. The access token itself stays valid until it expires, a few minutes at most.  After this call, [&#x60;POST /v1/auth/refresh&#x60;](#tag/authentication/POST/v1/auth/refresh) with that session\&#39;s refresh token fails, and the user logs in again with [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in). If the access token has already expired, the call returns 401: the client can skip it and just discard its tokens.  Error codes: none specific.  **Response meta** - No response body, so no meta. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { LogoutRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const config = new Configuration({ 
    // Configure HTTP bearer authorization: UserJWT
    accessToken: "YOUR BEARER TOKEN",
  });
  const api = new AuthenticationApi(config);

  try {
    const data = await api.logout();
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

`void` (Empty response body)

### Authorization

[UserJWT](../README.md#UserJWT)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | No content |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## refreshToken

> TokenPairResponse refreshToken(refreshInput)

Refresh the access token

Exchanges a refresh token for a fresh pair of tokens for the same tenant. Use it when the access token is about to expire or has expired, so the person stays signed in without typing a password again. Each refresh token works only once: every call returns a new one, and the old one stops working.  Use the refresh token returned by [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in), [&#x60;POST /v1/auth/accept-invite&#x60;](#tag/authentication/POST/v1/auth/accept-invite) or [&#x60;POST /v1/auth/switch-tenant&#x60;](#tag/tenant/POST/v1/auth/switch-tenant). Reusing an old refresh token revokes the whole session (token theft protection), so the user has to log in again.  Error codes: &#x60;invalid_token&#x60;, &#x60;token_expired&#x60;.  **Response meta** - &#x60;meta&#x60; is empty. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { RefreshTokenRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new AuthenticationApi();

  const body = {
    // RefreshInput
    refreshInput: ...,
  } satisfies RefreshTokenRequest;

  try {
    const data = await api.refreshToken(body);
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
| **refreshInput** | [RefreshInput](RefreshInput.md) |  | |

### Return type

[**TokenPairResponse**](TokenPairResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | New tokens for the same tenant |  -  |
| **401** | Missing, invalid or revoked API key. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## register

> RegistrationResponse register(registerInput)

Register a new account

Creates a new user account from a name, email address and password. Use it when someone signs up for Zerpto for the first time. It does not log the person in and does not create a tenant, so no tokens come back yet. The tenant is created later, during onboarding, once the person is logged in.  The account stays in &#x60;pending_verification&#x60; until the email address is confirmed with the link sent by email ([&#x60;POST /v1/auth/verify-email&#x60;](#tag/authentication/POST/v1/auth/verify-email)). Once confirmed, the user logs in with [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in).  Error codes: &#x60;email_taken&#x60;, &#x60;weak_password&#x60;.  **Response meta** - &#x60;actions&#x60;: [&#x60;login&#x60;](#tag/authentication/POST/v1/auth/sign-in), which is &#x60;POST /v1/auth/sign-in&#x60;. Use it once the email is confirmed. 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { RegisterRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new AuthenticationApi();

  const body = {
    // RegisterInput
    registerInput: ...,
  } satisfies RegisterRequest;

  try {
    const data = await api.register(body);
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
| **registerInput** | [RegisterInput](RegisterInput.md) |  | |

### Return type

[**RegistrationResponse**](RegistrationResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **201** | Account created. Confirm the email address, then log in. |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **409** | State conflict, e.g. duplicate code, or editing a posted document. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## verifyEmail

> VerifyEmailResponse verifyEmail(verifyEmailInput)

Confirm an email address

Confirms the email address of a new account with the token from the verification email. Use it when the person opens the link in that email, so the account can start logging in. Calling it again for an address that is already confirmed is safe: it does nothing new and returns the same response as the first time.  The token comes from the email sent by [&#x60;POST /v1/auth/sign-up&#x60;](#tag/authentication/POST/v1/auth/sign-up). After confirming, the user logs in with [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in).  Error codes: &#x60;invalid_token&#x60;, &#x60;token_expired&#x60;.  **Response meta** - &#x60;web_urls&#x60;: the login page of the web app. Send the user there to log in, or call [&#x60;POST /v1/auth/sign-in&#x60;](#tag/authentication/POST/v1/auth/sign-in). 

### Example

```ts
import {
  Configuration,
  AuthenticationApi,
} from '@zerpto/sdk';
import type { VerifyEmailRequest } from '@zerpto/sdk';

async function example() {
  console.log("🚀 Testing @zerpto/sdk SDK...");
  const api = new AuthenticationApi();

  const body = {
    // VerifyEmailInput
    verifyEmailInput: ...,
  } satisfies VerifyEmailRequest;

  try {
    const data = await api.verifyEmail(body);
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
| **verifyEmailInput** | [VerifyEmailInput](VerifyEmailInput.md) |  | |

### Return type

[**VerifyEmailResponse**](VerifyEmailResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Email confirmed. The account can now log in. |  -  |
| **400** | Malformed request or invalid parameter. |  -  |
| **422** | Well-formed but fails business rules, e.g. unbalanced entry or closed period. |  -  |
| **429** | Rate limit exceeded. |  * Retry-After - Seconds to wait before retrying. <br>  * X-RateLimit-Limit - Requests allowed per window. <br>  * X-RateLimit-Remaining - Requests left in the current window. <br>  * X-RateLimit-Reset - Unix time when the window resets. <br>  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

