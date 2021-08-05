package com.rkjoeson.flutter_easy_protector;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.NonNull;

import com.lahm.library.EasyProtectorLib;
import com.lahm.library.SecurityCheckUtil;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FlutterEasyProtectorPlugin
 */
public class FlutterEasyProtectorPlugin implements FlutterPlugin, MethodCallHandler {

    private MethodChannel channel;
    private Context context;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        context = flutterPluginBinding.getApplicationContext();
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.io/flutter_easy_protector");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull final MethodCall call, @NonNull final Result result) {
        switch (call.method) {
            // Security
            case "getSignature": {
                result.success(EasyProtectorLib.checkSignature(context));
            }
            break;

            case "checkIsDebug": {
                result.success(EasyProtectorLib.checkIsDebug(context));
            }
            break;

            case "checkIsPortUsing": {
                if (call.hasArgument("host") && call.hasArgument("port")) {
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            final boolean isUse = EasyProtectorLib.checkIsPortUsing(call.<String>argument("host"), call.<Integer>argument("port"));
                            new Handler(Looper.getMainLooper()).post(new Runnable() {
                                @Override
                                public void run() {
                                    result.success(isUse);
                                }
                            });
                        }
                    }).start();
                } else {
                    result.success(false);
                }
            }
            break;

            case "checkIsUsbCharging": {
                result.success(SecurityCheckUtil.getSingleInstance().checkIsUsbCharging(context));
            }
            break;

            case "checkIsRoot": {
                result.success(EasyProtectorLib.checkIsRoot());
            }
            break;

            case "checkIsXposedExist": {
                result.success(EasyProtectorLib.checkIsXposedExist());
            }
            break;

            case "checkXposedExistAndDisableIt": {
                result.success(EasyProtectorLib.checkXposedExistAndDisableIt());
            }
            break;

            case "checkHasLoadSO": {
                if (call.hasArgument("soName")) {
                    result.success(EasyProtectorLib.checkHasLoadSO(call.<String>argument("soName")));
                } else {
                    result.success(false);
                }
            }
            break;

            case "checkIsBeingTracedByJava": {
                result.success(EasyProtectorLib.checkIsBeingTracedByJava());
            }
            break;

            // Emulator
            case "checkIsRunningInEmulator": {
                boolean isEmulator = EasyProtectorLib.checkIsRunningInEmulator(context, null);
                result.success(isEmulator);
            }
            break;

            // virtualAPk
            case "checkIsRunningInVirtualApk": {
                if (call.hasArgument("uniqueMsg")) {
                    boolean inVirtualApk = EasyProtectorLib.checkIsRunningInVirtualApk(call.<String>argument("uniqueMsg"), null);
                    result.success(inVirtualApk);
                } else {
                    result.success(false);
                }
            }
            break;

            default: {
                result.notImplemented();
            }
            break;
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        context = null;
    }
}
