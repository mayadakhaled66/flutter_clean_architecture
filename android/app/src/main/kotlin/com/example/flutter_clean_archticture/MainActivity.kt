package com.example.flutter_clean_archticture

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
//    private val CHANNEL  = "com.example.flutter_clean_archticture/isHmsGmsAvailable"
//    var concurrentContext = this@MainActivity.context
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//    super.configureFlutterEngine(flutterEngine)
//    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
//            call, result ->
//        // Note: this method is invoked on the main thread.
//        if (call.method.equals("isHmsAvailable")) {
//            result.success(isHmsAvailable());
//        } else if (call.method.equals("isGmsAvailable")) {
//            result.success(isGmsAvailable());
//        } else {
//            result.notImplemented()
//        }
//    }
//}    private fun isHmsAvailable(): Boolean {
//    var isAvailable = false
//    val context: Context = concurrentContext
//    if (null != context) {
//        val result = HuaweiApiAvailability.getInstance().isHuaweiMobileServicesAvailable(context)
//        isAvailable = ConnectionResult.SUCCESS == result
//    }
//    Log.i("MainActivity", "isHmsAvailable: $isAvailable")
//    return isAvailable
//}    private fun isGmsAvailable(): Boolean {
//    var isAvailable = false
//    val context: Context = concurrentContext
//    if (null != context) {
//        val result: Int = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context)
//        isAvailable = com.google.android.gms.common.ConnectionResult.SUCCESS === result
//    }
//    Log.i("MainActivity", "isGmsAvailable: $isAvailable")
//    return isAvailable
//}
}