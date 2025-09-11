import 'package:flutter/material.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/screens/movies_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/widgets/movies/my_error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final _movieRepository = getIt<MoviesRepository>();

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    try {
      await _movieRepository.movieGenres();
      await getIt<NavigationService>().navigationReplace(MoviesScreen());
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ],
              ),
            )
          : MyErrorWidget(errorText: _errorMessage, retryFuction: _loadData),
    );
  }
}
