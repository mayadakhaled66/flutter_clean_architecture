import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_archticture/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_events.dart';
import 'package:flutter_clean_archticture/movies/presentation/view_model/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase)
      : super(MoviesStates(moviesStatus: MoviesStatus.initial)) {
    on<GetNowPlayingMoviesEvent>((event, emit) => _getNowPlayingMovies(emit));
  }

  Future<void> _getNowPlayingMovies(Emitter<MoviesStates> emit) async {
    state.moviesStatus = MoviesStatus.loading;
    emit(state);
    final response = await getNowPlayingMoviesUseCase.execute();
    response.fold(
      (l){
        state.moviesStatus = MoviesStatus.error;
        state.errorMessage = l.message;
        emit(state);
      },
      (r){
        state.moviesStatus = MoviesStatus.loaded;
        state.nowPlayingMovies = r;
        emit(state);
      },
    );
  }
}
