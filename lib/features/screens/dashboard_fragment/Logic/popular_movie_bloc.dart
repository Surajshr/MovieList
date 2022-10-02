import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_repository.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Logic/popular_movie_event.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Logic/popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  MovieRepository popularMovieRepository;
  PopularMovieBloc(this.popularMovieRepository) : super(PopularMovieInitialState()) {

    on<GetPopularMovieEvent>((event, emit) async {
      emit(PopularMovieLoadingState());
      try {
        final movieList = await popularMovieRepository.fetchMovieList();
        print(movieList);
          emit(PopularMovieLoadedState(movieList));
      } catch (e) {
        emit(PopularMovieErrorState(e.toString()));
      }
    });
  }
}
