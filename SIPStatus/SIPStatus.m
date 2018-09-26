
//
//  SIPStatus.m
//  SIPStatus
//
//  Created by Nickolas Pylarinos Stamatelatos on 26/09/2018.
//  Copyright © 2018 Nickolas Pylarinos Stamatelatos. All rights reserved.
//

#import "SIPStatus.h"

/*
 * syscall
 */
extern int csr_get_active_config(csr_config_t *config);

@implementation SIPStatus

//=================================================================
//                              INIT                             //
//=================================================================

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        /* get SIP config */
        csr_get_active_config(&config);
    }
    return self;
}

+ (SIPStatus *)sharedInstance
{
    static SIPStatus* obj = nil;
    if (obj == nil) { obj = [[SIPStatus alloc] init]; }
    return obj;
}

//=================================================================
//                              METHODS                          //
//=================================================================

- (BOOL)isEnabled
{
    return (config == CSR_VALID_FLAGS);
}

- (BOOL)protectsFS
{
    return NO;
}
- (BOOL)allowsTFP
{
    return NO;
}
- (BOOL)allowsKernDBG
{
    return NO;
}
- (BOOL)allowsDTRACE
{
    return NO;
}
- (BOOL)allowsNVRAM
{
    return NO;
}
- (BOOL)allowsDevConf
{
    return NO;
}
- (BOOL)allowsAnyRecovery
{
    return NO;
}
- (BOOL)allowsKexts
{
    return NO;
}

- (BOOL)isAppleInternal
{
    return NO;
}

@end
