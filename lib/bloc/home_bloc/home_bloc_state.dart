part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocloading extends HomeBlocState {}

class HomeBlocLoaded extends HomeBlocState {
  final List<Drinks> drinks;

  HomeBlocLoaded({this.drinks});
}

class HomeBlocError extends HomeBlocState {
  final String errorMessage;

  HomeBlocError(this.errorMessage);
}
