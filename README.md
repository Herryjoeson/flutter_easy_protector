# flutter_easy_protector
One line of code detects XP framework/debugging/multi-open/simulator/root permission in flutter

---

This plugin is based on the flutter version implemented by easy protector
The plugin can check whether the current Android environment is in the simulator or root detection, so as to alert users.

## Supported platforms

| Platform | `flutter_easy_protector` support |
| :------- | :----------------: |
| Android  |         ✅         |

## Usage

To use this plugin, follow the [installing guide](https://pub.dev/packages/flutter_easy_protector/install).

### Implementation

```dart
import 'package:flutter_easy_protector/flutter_easy_protector.dart';
// ...

// The following line checks whether Android is running in the debug environment.
FlutterEasyProtector.checkIsDebug;

// The following line checks whether Android is running in the root permission.
FlutterEasyProtector.checkIsRoot();

// The following line will check the Android is use exposed framework.
FlutterEasyProtector.checkIsXposedExist;

// The following line will check the Android is use exposed framework and close the exposed framework.
FlutterEasyProtector.checkXposedExistAndDisableIt;

// The following line will check the Android is use someone so library.
FlutterEasyProtector.checkHasLoadSO("soName")

// The following line checks whether Android is running in the simulator environment.
FlutterEasyProtector.checkIsRunningInEmulator

// The following line checks whether Android is more open in the application.
// If you want to use package name, you can use the package info plugin
FlutterEasyProtector.checkIsRunningInVirtualApk("packageName or some unique string")

// The following line is to check whether Android is in auxiliary charging state
FlutterEasyProtector.checkIsUsbCharging

// The following line is to check whether the Android port is occupied
FlutterEasyProtector.checkIsUsbCharging("host","port")
```

## Learn more

If you want to learn more about how this plugin works, how to contribute, etc., you can read through
the [main README on GitHub](https://github.com/Herryjoeson/flutter_easy_protector).