import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/screens/favourites_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';
import 'package:movie_app/widgets/movies/my_error_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MoviesModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  String? _errorMessage; // <-- track error
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() {
      _isFetching = true;
      _errorMessage = null; // reset error before fetch
    });
    try {
      final List<MoviesModel> movies = await getIt<MoviesRepository>()
          .fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (error) {
      setState(() {
        _errorMessage = "An error occurred: $error"; // store error
      });
      getIt<NavigationService>().showSnakbar('An error occurred $error');
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigation(FavouritesScreen());
            },
            icon: Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),
          IconButton(onPressed: () {}, icon: Icon(MyAppIcons.dark)),
        ],
      ),
      body: _errorMessage != null
          ? MyErrorWidget(errorText: _errorMessage!, retryFuction: _fetchMovies)
          : ListView.builder(
              controller: _scrollController,
              itemCount: _movies.length + (_isFetching ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _movies.length) {
                  return MoviesWidget(moviesModel: _movies[index]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
    );
  }
}
