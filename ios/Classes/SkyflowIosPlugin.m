#import "SkyflowIosPlugin.h"
#if __has_include(<skyflow_flutter/skyflow_flutter-Swift.h>)
#import <skyflow_flutter/skyflow_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "skyflow_flutter-Swift.h"
#endif

SWIFT_CLASS("SkyflowPlugin")
@interface StripePlugin : NSObject
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar ;
@end


@implementation SkyflowPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SkyflowPlugin registerWithRegistrar:registrar];
    
}
@end