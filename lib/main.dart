import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_hub/core/dependency_injection/service_locator.dart';
import 'package:social_hub/core/navigation/app_router.dart';
import 'package:social_hub/core/theme/app_theme.dart';
import 'package:social_hub/generated/l10n.dart';

//https://jsonplaceholder.typicode.com/ 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const SocialHubApp());
}

class SocialHubApp extends StatelessWidget {
  const SocialHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      locale: const Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'SocialHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
