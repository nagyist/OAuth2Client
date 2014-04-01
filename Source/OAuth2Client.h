//
//  OAuth2Client.h
//  OAuth2Client
//
//  Created by Michal Konturek on 31/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>

extern NSString * const kOAuthClientID;
extern NSString * const kOAuthClientSecret;
extern NSString * const kOAuthGrantType;
extern NSString * const kOAuthTokenAccess;
extern NSString * const kOAuthTokenRefresh;
extern NSString * const kOAuthRedirectURI;

@class OAuthCredential;

@interface OAuth2Client : AFHTTPSessionManager

+ (instancetype)createWithBaseURL:(NSURL *)baseURL
                         clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;

@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *clientSecret;
@property (nonatomic, strong) NSString *path;

- (instancetype)initWithBaseURL:(NSURL *)baseURL
                       clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;

- (void)authenticateWithUsername:(NSString *)username
                        password:(NSString *)password
                         success:(void (^)(OAuthCredential *credential))success
                         failure:(void (^)(NSError *error))failure;

@end
