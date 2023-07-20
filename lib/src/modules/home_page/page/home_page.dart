import 'package:flutter/material.dart';
import 'package:virusscanapp/src/modules/scan_page/page/scan_page.dart';
import 'package:virusscanapp/src/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: ScanPage(),
    );
  }
}
