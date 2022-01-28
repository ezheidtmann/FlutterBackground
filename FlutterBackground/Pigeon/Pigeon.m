// Autogenerated from Pigeon (v1.0.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}

@interface SingleValue ()
+ (SingleValue *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation SingleValue
+ (SingleValue *)fromMap:(NSDictionary *)dict {
  SingleValue *result = [[SingleValue alloc] init];
  result.theValue = dict[@"theValue"];
  if ((NSNull *)result.theValue == [NSNull null]) {
    result.theValue = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.theValue ? self.theValue : [NSNull null]), @"theValue", nil];
}
@end

@interface PigeonNativeBridgeCodecReader : FlutterStandardReader
@end
@implementation PigeonNativeBridgeCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [SingleValue fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface PigeonNativeBridgeCodecWriter : FlutterStandardWriter
@end
@implementation PigeonNativeBridgeCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[SingleValue class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface PigeonNativeBridgeCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PigeonNativeBridgeCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PigeonNativeBridgeCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PigeonNativeBridgeCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PigeonNativeBridgeGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    PigeonNativeBridgeCodecReaderWriter *readerWriter = [[PigeonNativeBridgeCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


void PigeonNativeBridgeSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PigeonNativeBridge> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.PigeonNativeBridge.getRandomValue"
        binaryMessenger:binaryMessenger
        codec:PigeonNativeBridgeGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getRandomValueWithError:)], @"PigeonNativeBridge api (%@) doesn't respond to @selector(getRandomValueWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        SingleValue *output = [api getRandomValueWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface PigeonFlutterBridgeCodecReader : FlutterStandardReader
@end
@implementation PigeonFlutterBridgeCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [SingleValue fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface PigeonFlutterBridgeCodecWriter : FlutterStandardWriter
@end
@implementation PigeonFlutterBridgeCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[SingleValue class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface PigeonFlutterBridgeCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PigeonFlutterBridgeCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PigeonFlutterBridgeCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PigeonFlutterBridgeCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PigeonFlutterBridgeGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    PigeonFlutterBridgeCodecReaderWriter *readerWriter = [[PigeonFlutterBridgeCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


@interface PigeonFlutterBridge ()
@property (nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation PigeonFlutterBridge
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}

- (void)sendRandomValueArg:(SingleValue *)arg_arg completion:(void(^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.PigeonFlutterBridge.sendRandomValue"
      binaryMessenger:self.binaryMessenger
      codec:PigeonFlutterBridgeGetCodec()];
  [channel sendMessage:@[arg_arg] reply:^(id reply) {
    completion(nil);
  }];
}
@end
