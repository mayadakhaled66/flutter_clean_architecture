import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_archticture/core/network/api_constants.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/local_notifications_service_provider.dart';
import 'package:flutter_clean_archticture/core/services/services_locator.dart';
import 'package:flutter_clean_archticture/movies/domain/entities/now_playing_movies.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_bloc.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_events.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_states.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/notifications/notification_data.dart';

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
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocProvider(
          create: (BuildContext context) =>
              serviceLocator<MoviesBloc>()..add(GetNowPlayingMoviesEvent()),
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
              //   case MoviesStatus.error:
              //     EasyLoading.showError(moviesStates.errorMessage);
              //     return const SizedBox();
              // }
              return TextButton(onPressed: sendLocalNotification, child: Text("Send"));
            },
          ),
        ),
      ),
    );
  }

  void sendLocalNotification(){
    LocalNotificationsServiceProvider.show(
       NotificationData(
          "new notification !!!",
          "helllooo",
          id:1,channelId:
          "app news",
          channelName: "app news"),
    );
  }

  Widget _buildMovieListItem(Result result) {
    return ListTile(
      leading: Image.network(ApiConstants.imagePath(result.backdropPath??"no data")),
      title: Text(result.title??"no data"),
      subtitle: Text(result.overview??"no data"),
    );
  }
}
