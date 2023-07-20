import 'package:go_router/go_router.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/page/analysis_report_page.dart';
import 'package:virusscanapp/src/modules/home_page/page/home_page.dart';
import 'package:virusscanapp/src/modules/scan_page/page/scan_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/scan',
        builder: (context, state) => const ScanPage(),
      ),
      GoRoute(
        path: '/analysis',
        builder: (context, state) {
          final String id = state.queryParameters["id"] ?? "";
          return AnalysisReportPage(id: id);
        },
      ),
    ],
  );
}
