//
//  OAuthCredential.h
//  OAuth2Client
//
//  Created by Michal Konturek on 31/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuthCredential : NSObject

+ (instancetype)createWithAccessToken:(NSString *)accessToken
                               ofType:(NSString *)tokenType;

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSString *tokenType;
@property (nonatomic, copy) NSDate *expiryDate;

- (id)initWithAccessToken:(NSString *)accessToken ofType:(NSString *)tokenType;

- (BOOL)isExpired;

@end
