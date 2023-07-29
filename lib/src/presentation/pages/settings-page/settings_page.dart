import 'package:flutter/material.dart';
import 'package:flutter_webviewer/src/presentation/pages/settings-page/components/settngs_body.dart';
import 'package:flutter_webviewer/src/utils/export.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.settingsPageTitle)),
      body: const SettingsBody(),
    );
  }
}
