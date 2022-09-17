part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class GetDrink extends HomeBlocEvent {}

class SearchDrink extends HomeBlocEvent {
  final String searchText;

  SearchDrink({this.searchText});
}
