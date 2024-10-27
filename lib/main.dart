import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/bindings/snack_binding.dart';
import 'app/modules/home/views/snack_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: SnackBinding(),
      home: SnackView(),
    );
  }
}
