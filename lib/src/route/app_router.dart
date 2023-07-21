import 'package:go_router/go_router.dart';
import 'package:virusscanapp/src/modules/home_page/page/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
