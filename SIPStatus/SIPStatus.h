//
//  SIPStatus.h
//  SIPStatus
//
//  Created by Nickolas Pylarinos Stamatelatos on 26/09/2018.
//  Copyright © 2018 Nickolas Pylarinos Stamatelatos. All rights reserved.
//

/*
 * Based on csrstat created Pike R. Alpha (https://github.com/Piker-Alpha/csrstat)
 */

#import <Cocoa/Cocoa.h>

//! Project version number for SIPStatus.
FOUNDATION_EXPORT double SIPStatusVersionNumber;

//! Project version string for SIPStatus.
FOUNDATION_EXPORT const unsigned char SIPStatusVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SIPStatus/PublicHeader.h>

/* Rootless configuration flags */
#define CSR_ALLOW_UNTRUSTED_KEXTS           (1 << 0)    // 1
#define CSR_ALLOW_UNRESTRICTED_FS           (1 << 1)    // 2
#define CSR_ALLOW_TASK_FOR_PID              (1 << 2)    // 4
#define CSR_ALLOW_KERNEL_DEBUGGER           (1 << 3)    // 8
#define CSR_ALLOW_APPLE_INTERNAL            (1 << 4)    // 16
#define CSR_ALLOW_UNRESTRICTED_DTRACE       (1 << 5)    // 32
#define CSR_ALLOW_UNRESTRICTED_NVRAM        (1 << 6)    // 64
#define CSR_ALLOW_DEVICE_CONFIGURATION      (1 << 7)    // 128
#define CSR_ALLOW_ANY_RECOVERY_OS           (1 << 8)    // 256
#define CSR_ALLOW_UNAPPROVED_KEXTS          (1 << 9)    // 512

#define CSR_VALID_FLAGS (CSR_ALLOW_UNTRUSTED_KEXTS | \
    CSR_ALLOW_UNRESTRICTED_FS | \
    CSR_ALLOW_TASK_FOR_PID | \
    CSR_ALLOW_KERNEL_DEBUGGER | \
    CSR_ALLOW_APPLE_INTERNAL | \
    CSR_ALLOW_UNRESTRICTED_DTRACE | \
    CSR_ALLOW_UNRESTRICTED_NVRAM  | \
    CSR_ALLOW_DEVICE_CONFIGURATION | \
    CSR_ALLOW_ANY_RECOVERY_OS | \
    CSR_ALLOW_UNAPPROVED_KEXTS)

/* Typedefs */
typedef uint32_t csr_config_t;

enum {
    SS_ENABLED = YES,
    SS_DISABLED = NO,
};

@interface SIPStatus : NSObject
{
    csr_config_t config;
}

+ (instancetype)sharedInstance;

/* properties */
@property BOOL status;

/* Methods */
- (BOOL)isEnabled;
- (BOOL)isAppleInternal;

- (BOOL)protectsFS;
- (BOOL)allowsTFP;  /* task-for-pid */
- (BOOL)allowsKernDBG;
- (BOOL)allowsDTRACE;
- (BOOL)allowsNVRAM;
- (BOOL)allowsDevConf;  /* device configuration */
- (BOOL)allowsAnyRecovery;
- (BOOL)allowsUnsignedKexts;
- (BOOL)allowsUnapprovedKexts;

- (NSDictionary *)getReport;

@end
