// Autogenerated from Pigeon (v1.0.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class SingleValue;

@interface SingleValue : NSObject
@property(nonatomic, strong, nullable) NSNumber * theValue;
@end

/// The codec used by PigeonNativeBridge.
NSObject<FlutterMessageCodec> *PigeonNativeBridgeGetCodec(void);

@protocol PigeonNativeBridge
- (nullable SingleValue *)getRandomValueWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void PigeonNativeBridgeSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PigeonNativeBridge> *_Nullable api);

/// The codec used by PigeonFlutterBridge.
NSObject<FlutterMessageCodec> *PigeonFlutterBridgeGetCodec(void);

@interface PigeonFlutterBridge : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)sendRandomValueArg:(SingleValue *)arg completion:(void(^)(NSError *_Nullable))completion;
@end
NS_ASSUME_NONNULL_END