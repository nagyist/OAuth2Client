//
//  SalesForce.h
//  OAuth2Client
//
//  Created by Michal Konturek on 01/04/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OAuth2Client.h"
#import "OAuthCredential.h"

@interface SalesForce : NSObject

+ (instancetype)create;

@property (nonatomic, strong) OAuth2Client *clientOAuth;

- (void)authenticate;

@end
