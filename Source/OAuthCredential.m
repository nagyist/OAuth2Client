//
//  OAuthCredential.m
//  OAuth2Client
//
//  Created by Michal Konturek on 31/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "OAuthCredential.h"

@implementation OAuthCredential

+ (instancetype)createWithAccessToken:(NSString *)accessToken
                               ofType:(NSString *)tokenType {
    return [[self alloc] initWithAccessToken:accessToken ofType:tokenType];
}

- (id)initWithAccessToken:(NSString *)accessToken ofType:(NSString *)tokenType {
    if (self = [super init]) {
        _accessToken = accessToken;
        _tokenType = tokenType;
    }
    return self;
}

- (BOOL)isExpired {
    if (!self.expiryDate) return NO;
    else return ([self.expiryDate compare:[NSDate date]] == NSOrderedAscending);
}

@end
