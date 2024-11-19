import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;

  const BaseScreen({
    super.key,
    required this.body,
    this.leading,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title ?? ''),
          leading: leading,
          actions: actions,
        ),
        body: body,
      );
    } else if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title ?? ''),
          leading: leading,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: actions ?? [],
          ),
        ),
        child: body,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title ?? ''),
          leading: leading,
          actions: actions,
        ),
        body: body,
      );
    }
  }
}
