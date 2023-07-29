import 'package:flutter/material.dart';
import 'package:flutter_webviewer/src/presentation/pages/home-page/components/home_body.dart';
import 'package:flutter_webviewer/src/utils/export.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(title: const Text(AppStrings.homePageTitle),actions: [
        IconButton(onPressed: (){
          context.goNamed(AppRoutes.settingsPage);
        }, icon:const Icon(Icons.settings))
      ],),
      body: const HomeBody(),
    );
  }
}