import 'package:device_preview/device_preview.dart';
import 'package:itlala/core/router/app_routes.dart';
import 'package:itlala/presentation/imports.dart';
import 'package:itlala/presentation/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRouterName.splashView,
            themeMode: ThemeMode.system,
            home: const LogoScreen(),
          );
        });
  }
}
