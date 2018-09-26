
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

//=================================================================
//                              HELPERS                          //
//=================================================================
BOOL shift(BOOL a) { return !a; }

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
- (BOOL)isAppleInternal
{
    return (config & CSR_ALLOW_APPLE_INTERNAL);
}

- (BOOL)protectsFS
{
    return !(config & CSR_ALLOW_UNRESTRICTED_FS);
}
- (BOOL)allowsTFP
{
    return (config & CSR_ALLOW_TASK_FOR_PID);
}
- (BOOL)allowsKernDBG
{
    return (config & CSR_ALLOW_KERNEL_DEBUGGER);
}
- (BOOL)allowsDTRACE
{
    return (config & CSR_ALLOW_UNRESTRICTED_DTRACE);
}
- (BOOL)allowsNVRAM
{
    return (config & CSR_ALLOW_UNRESTRICTED_NVRAM);
}
- (BOOL)allowsDevConf
{
    return (config & CSR_ALLOW_DEVICE_CONFIGURATION);
}
- (BOOL)allowsAnyRecovery
{
    return (config & CSR_ALLOW_ANY_RECOVERY_OS);
}
- (BOOL)allowsUnsignedKexts
{
    return (config & CSR_ALLOW_UNTRUSTED_KEXTS);
}
- (BOOL)allowsUnapprovedKexts
{
    return (config & CSR_ALLOW_UNAPPROVED_KEXTS);
}

- (NSDictionary *)getReport
{
    NSDictionary *report = @{
                             @"Apple Internal" : [NSNumber numberWithBool:[self isAppleInternal]],
                             
                             @"Allows Unsigned Kexts" : [NSNumber numberWithBool:[self isAppleInternal]],
                             @"Allows Task for PID" : [NSNumber numberWithBool:[self allowsTFP]],
                             @"Restricts Filesystem" : [NSNumber numberWithBool:[self protectsFS]],
                             @"Allows Debugging" : [NSNumber numberWithBool:[self allowsKernDBG]],
                             @"Allows DTrace" : [NSNumber numberWithBool:[self allowsDTRACE]],
                             @"Allows NVRAM" : [NSNumber numberWithBool:[self allowsNVRAM]],
                             @"Allows Device Configuration" : [NSNumber numberWithBool:[self allowsDevConf]],
                             @"Allows Any Recovery OS" : [NSNumber numberWithBool:[self allowsAnyRecovery]],
                             @"Allow Unapproved Kexts" : [NSNumber numberWithBool:[self allowsUnapprovedKexts]],
                             };
    return report;
}

@end
