import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:disable_battery_optimization/disable_battery_optimization.dart';

void main() {
  const MethodChannel channel = MethodChannel('disable_battery_optimization');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });
}
