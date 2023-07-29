import 'package:flutter/material.dart';
import 'package:flutter_webviewer/src/presentation/pages/home-page/components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}