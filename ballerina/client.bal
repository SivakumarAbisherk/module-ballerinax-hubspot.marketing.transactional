// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com/marketing/v3/transactional") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            httpClientConfig.auth = <http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    resource isolated function delete smtp\-tokens/[string tokenId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/smtp-tokens/${getEncodedUri(tokenId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    resource isolated function get smtp\-tokens(map<string|string[]> headers = {}, *GetMarketingV3TransactionalSmtpTokens_gettokenspageQueries queries) returns CollectionResponseSmtpApiTokenViewForwardPaging|error {
        string resourcePath = string `/smtp-tokens`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    resource isolated function get smtp\-tokens/[string tokenId](map<string|string[]> headers = {}) returns SmtpApiTokenView|error {
        string resourcePath = string `/smtp-tokens/${getEncodedUri(tokenId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    resource isolated function post single\-email/send(PublicSingleSendRequestEgg payload, map<string|string[]> headers = {}) returns EmailSendStatusView|error {
        string resourcePath = string `/single-email/send`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post smtp\-tokens(SmtpApiTokenRequestEgg payload, map<string|string[]> headers = {}) returns SmtpApiTokenView|error {
        string resourcePath = string `/smtp-tokens`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post smtp\-tokens/[string tokenId]/password\-reset(map<string|string[]> headers = {}) returns SmtpApiTokenView|error {
        string resourcePath = string `/smtp-tokens/${getEncodedUri(tokenId)}/password-reset`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }
}
