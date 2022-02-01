// Autogenerated from Pigeon (v1.0.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class SingleValue {
  int? theValue;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['theValue'] = theValue;
    return pigeonMap;
  }

  static SingleValue decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SingleValue()
      ..theValue = pigeonMap['theValue'] as int?;
  }
}

class _PigeonNativeBridgeCodec extends StandardMessageCodec {
  const _PigeonNativeBridgeCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SingleValue) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return SingleValue.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class PigeonNativeBridge {
  /// Constructor for [PigeonNativeBridge].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PigeonNativeBridge({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _PigeonNativeBridgeCodec();

  Future<SingleValue> getRandomValue() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PigeonNativeBridge.getRandomValue', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as SingleValue?)!;
    }
  }
}

class _PigeonFlutterBridgeCodec extends StandardMessageCodec {
  const _PigeonFlutterBridgeCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SingleValue) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return SingleValue.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}
abstract class PigeonFlutterBridge {
  static const MessageCodec<Object?> codec = _PigeonFlutterBridgeCodec();

  void sendRandomValue(SingleValue arg);
  static void setup(PigeonFlutterBridge? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PigeonFlutterBridge.sendRandomValue', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.PigeonFlutterBridge.sendRandomValue was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final SingleValue? arg_arg = (args[0] as SingleValue?);
          assert(arg_arg != null, 'Argument for dev.flutter.pigeon.PigeonFlutterBridge.sendRandomValue was null, expected non-null SingleValue.');
          api.sendRandomValue(arg_arg!);
          return;
        });
      }
    }
  }
}