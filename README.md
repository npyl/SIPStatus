##  SIPStatus

The Objective-C framework that gives you info about your SIP (System Integrity Protection).

## API 📓

```ObjC
- (BOOL)isEnabled;
- (BOOL)isAppleInternal;

- (BOOL)protectsFS;
- (BOOL)allowsTFP;
- (BOOL)allowsKernDBG;
- (BOOL)allowsDTRACE;
- (BOOL)allowsNVRAM;
- (BOOL)allowsDevConf;
- (BOOL)allowsAnyRecovery;
- (BOOL)allowsUnsignedKexts;
- (BOOL)allowsUnapprovedKexts;

- (NSDictionary *)getReport;
```

## DONATING 💰

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NSV636CUWX754)

OR:

```
BTC: 31qFE5JFeReEftU1sjDqigUDmpxYuTdwQm
BCH: qq04pjvvlx406r7pd9dm3ft2smc4qc2njyjccpd6kw
LTC: 3N1EuxbmeXeTFjLEqmHeZfjK7HUig9XzpX
```