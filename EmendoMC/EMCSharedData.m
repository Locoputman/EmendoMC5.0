//
//  EMCSharedData.m
//  EmendoMC
//
//  Created by Silas Schwarz on 6/2/13.
//  Copyright (c) 2013 Silas Schwarz. All rights reserved.
//

#import "EMCSharedData.h"

static EMCSharedData *sharedData;

@implementation EMCSharedData

+ (void)initialize
{
    sharedData = [[self alloc] init];
}
+ (EMCSharedData *)sharedData
{
    return sharedData;
}

@end
