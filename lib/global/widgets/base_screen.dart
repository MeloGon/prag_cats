import 'dart:io';

import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget? androidBody;
  final Widget? iosBody;

  const BaseScreen({super.key, this.androidBody, this.iosBody});

  static bool isIos(BuildContext context) => Platform.isIOS;

  static bool isAndroid(BuildContext context) => Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    if (isIos(context)) {
      return iosBody!;
    } else if (isAndroid(context)) {
      return androidBody!;
    } else {
      return androidBody!;
    }
  }
}
