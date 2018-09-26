//
//  main.m
//  tester
//
//  Created by Nickolas Pylarinos Stamatelatos on 26/09/2018.
//  Copyright © 2018 Nickolas Pylarinos Stamatelatos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SIPStatus/SIPStatus.h>

int main(int argc, const char * argv[]) {

    SIPStatus *SIP = [SIPStatus sharedInstance];
    
    NSLog(@"%@", [SIP getReport]);
    
    return 0;
}
