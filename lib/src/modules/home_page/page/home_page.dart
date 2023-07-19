import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/modules/section/scan_file/page/scan_file_section.dart';
import 'package:virusscanapp/src/modules/section/scan_url/page/scan_url_section.dart';
import 'package:virusscanapp/src/modules/section/search/page/search_section.dart';
import 'package:virusscanapp/src/widgets/custom_tab_bar.dart';
import 'package:virusscanapp/src/widgets/custom_tab_bar_child.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 100.h),
        CustomTabBar(
          tabController: _tabController,
          tabs: const [
            CustomTabChild(title: TextConstant.file),
            CustomTabChild(title: TextConstant.url),
            CustomTabChild(title: TextConstant.search),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ScanFileSection(),
              ScanUrlSection(),
              SearchSection(),
            ],
          ),
        )
      ],
    ));
  }
}
