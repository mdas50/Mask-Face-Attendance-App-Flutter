import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:worker_manager/worker_manager.dart';

import 'core/app/views/root.dart';
import 'core/utils/ui_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppUiHelper.autoRotateOff();
  runApp(TuringTechApp());
  await Executor().warmUp();
}


// import com.ttv.attendance.CamerakitPlugin;
//  
//  try {
//    flutterEngine.getPlugins().add(new CamerakitPlugin());
//   } catch(Exception e) {
//     Log.e(TAG, "Error registering plugin camera, io.flutter.plugins.camera.CameraPlugin", e);
//   }
// 