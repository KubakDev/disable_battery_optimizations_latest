import 'dart:developer';

import 'package:disable_battery_optimizations_latest/disable_battery_optimizations_latest.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Disable Battery Optimizations Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                child: Text("Is Auto Start Enabled"),
                onPressed: () async {
                  bool? isAutoStartEnabled =
                      await DisableBatteryOptimizationLatest.isAutoStartEnabled;
                  log(
                    "Auto start is ${isAutoStartEnabled == true ? "Enabled" : "Disabled"}",
                  );
                },
              ),
              MaterialButton(
                child: Text("Is Battery optimization disabled"),
                onPressed: () async {
                  bool? isBatteryOptimizationDisabled =
                      await DisableBatteryOptimizationLatest
                          .isBatteryOptimizationDisabled;
                  log(
                    "Battery optimization is ${!(isBatteryOptimizationDisabled == true) ? "Enabled" : "Disabled"}",
                  );
                },
              ),
              MaterialButton(
                child: Text("Is Manufacturer Battery optimization disabled"),
                onPressed: () async {
                  bool? isManBatteryOptimizationDisabled =
                      await DisableBatteryOptimizationLatest
                          .isManufacturerBatteryOptimizationDisabled;
                  log(
                    "Manufacturer Battery optimization is ${!(isManBatteryOptimizationDisabled == true) ? "Enabled" : "Disabled"}",
                  );
                },
              ),
              MaterialButton(
                child: Text("Are All Battery optimizations disabled"),
                onPressed: () async {
                  bool? isAllBatteryOptimizationDisabled =
                      await DisableBatteryOptimizationLatest
                          .isAllBatteryOptimizationDisabled;
                  log(
                    "All Battery optimizations are disabled ${(isAllBatteryOptimizationDisabled == true) ? "True" : "False"}",
                  );
                },
              ),
              MaterialButton(
                child: Text("Enable Auto Start"),
                onPressed: () {
                  DisableBatteryOptimizationLatest.showEnableAutoStartSettings(
                    "Enable Auto Start",
                    "Follow the steps and enable the auto start of this app",
                  );
                },
              ),
              MaterialButton(
                child: Text("Disable Battery Optimizations"),
                onPressed: () {
                  DisableBatteryOptimizationLatest.showDisableBatteryOptimizationSettings();
                },
              ),
              MaterialButton(
                child: Text("Disable Manufacturer Battery Optimizations"),
                onPressed: () {
                  DisableBatteryOptimizationLatest.showDisableManufacturerBatteryOptimizationSettings(
                    "Your device has additional battery optimization",
                    "Follow the steps and disable the optimizations to allow smooth functioning of this app",
                  );
                },
              ),
              MaterialButton(
                child: Text("Disable all Optimizations"),
                onPressed: () {
                  DisableBatteryOptimizationLatest.showDisableAllOptimizationsSettings(
                    "Enable Auto Start",
                    "Follow the steps and enable the auto start of this app",
                    "Your device has additional battery optimization",
                    "Follow the steps and disable the optimizations to allow smooth functioning of this app",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
