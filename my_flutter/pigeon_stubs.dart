import 'package:pigeon/pigeon.dart';

class SingleValue {
  int theValue;
}

@HostApi()
abstract class PigeonNativeBridge {
  SingleValue getRandomValue();
}

@FlutterApi()
abstract class PigeonFlutterBridge {
  void sendRandomValue(SingleValue arg);
}
