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

@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, strong) NSString *tokenType;
@property (nonatomic, strong) NSDate *expiryDate;

@property (nonatomic, assign, getter = isExpired) BOOL expired;

- (id)initWithAccessToken:(NSString *)accessToken ofType:(NSString *)tokenType;

@end
