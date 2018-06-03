#import "FlutterAmplitudePlugin.h"
#import "Amplitude.h"

@implementation FlutterAmplitudePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ly.eval.flutter_amplitude"
            binaryMessenger:[registrar messenger]];
  FlutterAmplitudePlugin* instance = [[FlutterAmplitudePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if([@"initAmplitudeSDK" isEqualToString:call.method]) {
      [self initSDK:call.arguments];
  } else if([@"logEvent" isEqualToString:call.method]){
      NSMutableDictionary *eventProperties = [call.arguments mutableCopy];
      NSString *eventName = call.arguments[@"eventName"];
      [eventProperties removeObjectForKey:@"eventName"];
      [self logEvent:eventName addEventProperties:eventProperties];
  } else if([@"setUserId" isEqualToString:call.method]){
      [self setUserId:call.arguments[@"userId"]];
  } else if([@"setUserProperties" isEqualToString:call.method]){
      [self setUserProperties:call.arguments];
  } else if([@"clearUserProperties" isEqualToString:call.method]){
      [self clearUserProperties];
  } else {
      result(FlutterMethodNotImplemented);
  }
}

- (void)initSDK:(NSDictionary*)configuration{
  NSString *apiKey = configuration[@"apiKey"];
  BOOL enableLocationListening = [(NSNumber *)[configuration objectForKey:@"enableLocationListening"] boolValue];
  [[Amplitude instance] initializeApiKey:apiKey];
  if(enableLocationListening){
      [[Amplitude instance] enableLocationListening];
  }else {
      [[Amplitude instance] disableLocationListening];
  }
}

- (void)setUserId:(NSString*)userId {
      [[Amplitude instance] setUserId:userId];
}

- (void)setUserProperties:(NSDictionary*)userProperties {
      [[Amplitude instance] setUserProperties:userProperties];
}

- (void)clearUserProperties {
      [[Amplitude instance] clearUserProperties];
}

- (void)logEvent:(NSString*)eventName addEventProperties:(NSDictionary*)eventProperties {
      [[Amplitude instance] logEvent:eventName withEventProperties:eventProperties];
}

@end
