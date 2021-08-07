import 'dart:async';

import 'package:flutter/services.dart';

class FlutterEasyProtector {
  FlutterEasyProtector._();

  static const MethodChannel _channel = const MethodChannel('plugins.io/flutter_easy_protector');

  /// 插件是否是debug模式
  static Future<bool> get checkIsDebug async => await _channel.invokeMethod("checkIsDebug");

  /// 检查端口是否使用
  static Future<bool> checkIsPortUsing(String host, int port) async =>
      await _channel.invokeMethod("checkIsPortUsing", <String, dynamic>{"host": host, "port": port});

  /// usb充电辅助判断
  static Future<bool> get checkIsUsbCharging async => await _channel.invokeMethod("checkIsUsbCharging");

  /// 是否root权限
  static Future<bool> get checkIsRoot async => await _channel.invokeMethod("checkIsRoot");

  /// 是否存在xp框架
  static Future<bool> get checkIsXposedExist async => await _channel.invokeMethod("checkIsXposedExist");

  /// 尝试关闭XP框架
  static Future<bool> get checkXposedExistAndDisableIt async {
    final bool isExposedFramework = await checkIsXposedExist;
    if (isExposedFramework) {
      return await _channel.invokeMethod("checkXposedExistAndDisableIt");
    }
    return false;
  }

  /// 检查是否加载某个so库
  static Future<bool> checkHasLoadSO(String soName) async {
    if (soName.trim().length > 0) {
      return await _channel.invokeMethod("checkHasLoadSO", <String, String>{"soName": soName});
    }
    return false;
  }

  /// java读取/proc/uid/status文件里TracerPid的方式来检测是否被调试
  static Future<bool> get checkIsBeingTracedByJava async => await _channel.invokeMethod("checkIsBeingTracedByJava");

  /// 是否模拟器运行
  static Future<bool> get checkIsRunningInEmulator async => await _channel.invokeMethod("checkIsRunningInEmulator");

  /// 是否多开
  static Future<bool> checkIsRunningInVirtualApk(String uniqueMsg) async =>
      await _channel.invokeMethod("checkIsRunningInVirtualApk", <String, String>{"uniqueMsg": uniqueMsg});
}
