import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/screens/favourites_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MoviesModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
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
    });
    try {
      final List<MoviesModel> movies = await getIt<MoviesRepository>()
          .fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (error) {
      getIt<NavigationService>().showSnakbar('An error occured $error');
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigation(FavouritesScreen());
            },
            icon: Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              // final List<MoviesModel> movies = await getIt<ApiService>()
              //     .fetchMovies();
              // log("movies $movies");
              // final List<MovieGenres> genres = await getIt<MoviesRepository>()
              //     .movieGenres();
              // await getIt<ApiService>().movieGenres();
              // log("genres $genres");
            },
            icon: Icon(MyAppIcons.dark),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _movies.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _movies.length) {
            return MoviesWidget(moviesModel: _movies[index]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
