import 'package:equatable/equatable.dart';
import 'package:listmovie/features/screens/dashboard_fragment/Data_layer/popular_movie_model.dart';

abstract class PopularMovieState extends Equatable{
}


class PopularMovieInitialState extends PopularMovieState {
  @override
  List<Object?> get props =>[];
}
class PopularMovieLoadingState extends PopularMovieState{
  @override
  List<Object?> get props =>[];
}

class PopularMovieLoadedState extends PopularMovieState {
  final MovieModel popularMovie;
  PopularMovieLoadedState(this.popularMovie);
  @override
  List<Object?> get props =>[popularMovie];
}

class PopularMovieErrorState extends PopularMovieState {
  final String error;
  PopularMovieErrorState(this.error);
  @override
  List<Object?> get props =>[error];
}
