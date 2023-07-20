import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/route/app_router.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 840),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => _buildMaterialApp(context),
    );
  }

  MaterialApp _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      title: TextConstant.titleApp,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorTheme.scienceBlue),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale("en"),
      supportedLocales: const [
        Locale(TextConstant.en),
        Locale(TextConstant.vi),
      ],
    );
  }
}
