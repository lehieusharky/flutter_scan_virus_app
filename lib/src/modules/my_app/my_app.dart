import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/my_app/bloc/my_app_bloc.dart';
import 'package:virusscanapp/src/route/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _languageCode = TextConstant.vi;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => MyAppBloc())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(369, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocConsumer<MyAppBloc, MyAppState>(
            listener: (context, state) {
              if (state is MyAppGetDefaultLanguageSuccess) {
                _languageCode = state.languageCode;
              }
              if (state is MyAppUpdateLanguageSuccess) {
                _languageCode = state.languageCode;
              }
            },
            builder: (context, state) {
              return _buildMaterialApp(context);
            },
          );
        },
      ),
    );
  }

  MaterialApp _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(_languageCode),
      supportedLocales: const [
        Locale(TextConstant.en),
        Locale(TextConstant.vi),
      ],
      theme: ThemeData.light(),
      title: TextConstant.titleApp,
    );
  }
}