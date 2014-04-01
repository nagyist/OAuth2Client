//
//  SalesForce.m
//  OAuth2Client
//
//  Created by Michal Konturek on 01/04/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "SalesForce.h"

static NSString * const kClientID = @"XXX";
static NSString * const kSecretKey = @"XXX";
static NSString * const kRedirectURL = @"warehouse://auth/success";

@implementation SalesForce

+ (instancetype)create {
    id instance = [[self alloc] init];
    return instance;
}

- (OAuth2Client *)clientOAuth {
    if (!_clientOAuth) {
        id baseURL = [NSURL URLWithString:@"https://login.salesforce.com"];
        _clientOAuth = [OAuth2Client createWithBaseURL:baseURL
                                              clientID:kClientID
                                          clientSecret:kSecretKey];
    }
    
    _clientOAuth.path = @"/services/oauth2/token";
    
    return _clientOAuth;
}

- (void)authenticate {
    [self.clientOAuth authenticateWithUsername:@""
                                      password:@""
                                       success:^(OAuthCredential *credential) {
                                           NSLog(@"Token: %@", credential.accessToken);
                                       }
                                       failure:^(NSError *error) {
                                           NSLog(@"Error: %@", error);
                                       }];
}

@end
