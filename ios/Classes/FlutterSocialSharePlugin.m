#import "FlutterSocialSharePlugin.h"
#import <flutter_social_share/flutter_social_share-Swift.h>

@implementation FlutterSocialSharePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSocialSharePlugin registerWithRegistrar:registrar];
}
@end
