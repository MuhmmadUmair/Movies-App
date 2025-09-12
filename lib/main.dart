import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/screens/movies_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view_model/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ load env first
  await dotenv.load(fileName: "assets/.env");

  // ✅ setup locator
  setupLocator();

  // ✅ preload genres
  try {
    final repo = getIt<MoviesRepository>();
    await repo.movieGenres();
  } catch (e) {
    debugPrint("Startup error: $e"); // don’t crash
  }
  // ✅ lock orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: Consumer(
        builder: (context, ThemeProvider themeProvider, child) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            title: 'Movies App',
            theme: themeProvider.themeData,
            home: const MoviesScreen(),
          );
        },
      ),
    );
  }
}
