import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_archticture/core/localization/app_localizations.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/locales.dart';
import 'package:flutter_clean_archticture/core/network/api_constants.dart';
import 'package:flutter_clean_archticture/core/services/services_locator.dart';
import 'package:flutter_clean_archticture/login/presentation/login_screen.dart';
import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_bloc.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_states.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate(LocaleKeys.hello)),
      ),
      body: Center(
        child: BlocProvider(
          create: (BuildContext context) =>
              serviceLocator<MoviesBloc>(),//..add(GetNowPlayingMoviesEvent()),
          child: BlocBuilder<MoviesBloc, MoviesStates>(
            builder: (BuildContext context, MoviesStates moviesStates) {
              // switch (moviesStates.moviesStatus) {
              //   case MoviesStatus.initial:
              //     return const SizedBox();
              //   case MoviesStatus.loading:
              //     EasyLoading.show();
              //     return const SizedBox();
              //   case MoviesStatus.loaded:
              //     EasyLoading.dismiss();
              //     return ListView(
              //       children: [
              //         ...moviesStates.nowPlayingMovies!.results
              //             .map((e) => _buildMovieListItem(e))
              //             .toList()
              //       ],
              //     );
              //
              //   case MoviesStatus.error:
              //     EasyLoading.showError(moviesStates.errorMessage);
              //     return const SizedBox();
              // }
              return TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(title: AppLocalizations.translate(LocaleKeys.hello))));                // context.go('/to');
              }, child: Text(AppLocalizations.translate(LocaleKeys.hello),));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMovieListItem(Result result) {
    return ListTile(
      leading: Image.network(ApiConstants.imagePath(result.backdropPath)),
      title: Text(result.title),
      subtitle: Text(result.overview),
    );
  }
}
