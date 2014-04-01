//
//  OAuth2Client.m
//  OAuth2Client
//
//  Created by Michal Konturek on 31/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "OAuth2Client.h"

#import "OAuthCredential.h"

NSString * const kOAuthClientID = @"client_id";
NSString * const kOAuthClientSecret = @"client_secret";
NSString * const kOAuthGrantType = @"grant_type";
NSString * const kOAuthTokenAccess = @"access_token";
NSString * const kOAuthTokenRefresh = @"refresh_token";
NSString * const kOAuthRedirectURI = @"redirect_uri";

@implementation OAuth2Client

+ (instancetype)createWithBaseURL:(NSURL *)baseURL
                         clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret {
    return [[self alloc] initWithBaseURL:baseURL clientID:clientID clientSecret:clientSecret];
}

- (instancetype)initWithBaseURL:(NSURL *)baseURL
                       clientID:(NSString *)clientID clientSecret:(NSString *)clientSecret {
    
    NSParameterAssert(baseURL);
    NSParameterAssert(clientID);
    NSParameterAssert(clientSecret);
    
    id configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    if (self = [super initWithBaseURL:baseURL sessionConfiguration:configuration]) {
        
        _clientID = clientID;
        _clientSecret = clientSecret;
        
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    }
    
    return self;
}

- (void)authenticateWithUsername:(NSString *)username
                        password:(NSString *)password
                         success:(void (^)(OAuthCredential *credential))success
                         failure:(void (^)(NSError *error))failure {

    id path = (self.path) ? self.path : @"";

    id params = [NSMutableDictionary dictionary];
    [params setObject:@"password" forKey:@"grant_type"];
    [params setObject:username forKey:@"username"];
    [params setObject:password forKey:@"password"];
    
    [self POST:path parameters:params constructingBodyWithBlock:nil
       success:^(NSURLSessionDataTask *task, id responseObject) {
           
       }
       failure:^(NSURLSessionDataTask *task, NSError *error) {
           
       }];
    
    [self POST:path parameters:params constructingBodyWithBlock:nil success:nil failure:nil];
}

//- (NSMutableDictionary *)paramters {
//    id params = [NSMutableDictionary dictionary];
//    [params setObject:kAFOAuthPasswordCredentialsGrantType forKey:@"grant_type"];
//    [params setValue: forKey:@"username"];
//    [params setValue:password forKey:@"password"];
//    return params;
//}




@end
