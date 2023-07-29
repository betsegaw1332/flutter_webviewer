import 'package:flutter/material.dart';
import 'package:flutter_webviewer/src/presentation/pages/settings-page/components/settngs_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsBody(),
    );
  }
}