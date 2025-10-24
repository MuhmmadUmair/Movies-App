import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/Enums/theme_enum.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/view_models/theme_provider.dart';
import 'constants/my_theme_data.dart';
import 'service/init_getit.dart';
import 'service/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Initialize GetIt
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(ProviderScope(child: const MyApp()));
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: themeState == ThemeEnum.dark
          ? MyThemeData.darkTheme
          : MyThemeData.lightTheme,
      home: const SplashScreen(),
      // const SplashScreen(), //const MovieDetailsScreen(), //const FavoritesScreen(), //const MoviesScreen(),
    );
  }
}
