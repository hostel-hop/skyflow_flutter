#import "SkyflowIosPlugin.h"
#if __has_include(<skyflow_ios/skyflow_ios-Swift.h>)
#import <skyflow_ios/skyflow_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "skyflow_ios-Swift.h"
#endif

SWIFT_CLASS("SkyflowPlugin")
@interface SkyflowPlugin : NSObject
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar ;
@end


@implementation SkyflowIosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SkyflowPlugin registerWithRegistrar:registrar];
}
@end