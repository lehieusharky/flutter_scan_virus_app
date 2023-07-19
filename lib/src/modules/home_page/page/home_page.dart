import 'package:flutter/material.dart';
import 'package:virusscanapp/src/modules/scan_page/page/scan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScanPage(),
    );
  }
}
