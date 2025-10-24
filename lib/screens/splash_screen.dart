import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/screens/movies_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view_models/favourites/favourite_provider.dart';
import 'package:movie_app/view_models/movies/movies_provider.dart';
import 'package:movie_app/widgets/my_error_widget.dart';

final initializationProvider = FutureProvider.autoDispose((ref) async {
  ref.keepAlive();
  await Future.microtask(() async {
    await ref.read(favouriteProvider.notifier).loadFavourites();
    await ref.read(movieProvider.notifier).getMovies();
  });
});

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initWatch = ref.watch(initializationProvider);
    return Scaffold(
      body: initWatch.when(
        data: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            getIt<NavigationService>().navigationReplace(const MoviesScreen());
          });
          return const SizedBox.shrink();
        },
        error: (error, _) {
          return MyErrorWidget(
            errorText: error.toString(),
            retryFunction: () => ref.refresh(initializationProvider),
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
