import 'package:flutter/material.dart';
import 'package:flutter_easy_protector/flutter_easy_protector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, bool> _isPressMap = {
    "checkIsPortUsing": false,
    "checkIsRoot": false,
    "checkIsXposedExist": false,
    "checkXposedExistAndDisableIt": false,
    "checkHasLoadSO": false,
    "checkIsBeingTracedByJava": false,
    "checkIsRunningInEmulator": false,
    "checkIsRunningInVirtualApk": false,
  };

  void onButtonClickListener(String methodName) {
    switch (methodName) {
      case "checkIsDebug":
        _isPressMap["checkIsDebug"] = true;
        break;
      case "checkIsPortUsing":
        _isPressMap["checkIsPortUsing"] = true;
        break;
      case "checkIsUsbCharging":
        _isPressMap["checkIsUsbCharging"] = true;
        break;
      case "checkIsRoot":
        _isPressMap["checkIsRoot"] = true;
        break;
      case "checkIsXposedExist":
        _isPressMap["checkIsXposedExist"] = true;
        break;
      case "checkXposedExistAndDisableIt":
        _isPressMap["checkXposedExistAndDisableIt"] = true;
        break;
      case "checkHasLoadSO":
        _isPressMap["checkHasLoadSO"] = true;
        break;
      case "checkIsBeingTracedByJava":
        _isPressMap["checkIsBeingTracedByJava"] = true;
        break;
      case "checkIsRunningInEmulator":
        _isPressMap["checkIsRunningInEmulator"] = true;
        break;
      case "checkIsRunningInVirtualApk":
        _isPressMap["checkIsRunningInVirtualApk"] = true;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsDebug"),
                  child: Text("checkIsDebug"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsDebug"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsDebug,
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsPortUsing"),
                  child: Text("checkIsPortUsing"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsPortUsing"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsPortUsing("127.0.0.1", 80),
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsUsbCharging"),
                  child: Text("checkIsUsbCharging"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsUsbCharging"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsUsbCharging,
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsRoot"),
                  child: Text("checkIsRoot"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsRoot"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsRoot,
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsXposedExist"),
                  child: Text("checkIsXposedExist"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsXposedExist"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsXposedExist,
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkXposedExistAndDisableIt"),
                  child: Text("checkXposedExistAndDisableIt"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkXposedExistAndDisableIt"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkXposedExistAndDisableIt,
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkHasLoadSO"),
                  child: Text("checkHasLoadSO"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkHasLoadSO"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkHasLoadSO("share.so"),
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsRunningInEmulator"),
                  child: Text("checkIsRunningInEmulator"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsRunningInEmulator"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsRunningInEmulator,
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () => onButtonClickListener("checkIsRunningInVirtualApk"),
                  child: Text("checkIsRunningInVirtualApk"),
                ),
                FutureBuilder(
                  builder: _buildFutureWidget,
                  future: _isPressMap["checkIsRunningInVirtualApk"] == true
                      ? Future.delayed(
                          const Duration(milliseconds: 500),
                          () async => await FlutterEasyProtector.checkIsRunningInVirtualApk("com.exmaple.demo"),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFutureWidget(BuildContext context, AsyncSnapshot snapshot) {
    List<Widget> children = [];
    if (snapshot.hasData) {
      children = <Widget>[
        const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'Result: ${snapshot.data}',
            style: TextStyle(fontSize: 16),
          ),
        )
      ];
    } else if (snapshot.hasError) {
      children = <Widget>[
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Error: ${snapshot.error}'),
        )
      ];
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      children = const <Widget>[
        SizedBox(
          child: CircularProgressIndicator(),
          width: 45,
          height: 45,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Awaiting result...'),
        )
      ];
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
