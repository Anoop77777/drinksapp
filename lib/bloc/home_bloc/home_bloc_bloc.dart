import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_intervel_test/bloc/home_bloc/home_bloc_api.dart';
import 'package:team_intervel_test/model/drink_list_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial());
  Stream<HomeBlocState> mapEventToState(HomeBlocEvent event) async* {
    try {
      if (event is GetDrink) {
        yield HomeBlocloading();
        DrinkListModel model = await DrinkListService.getDrinkList();
        if (model == null) {
          yield HomeBlocError("Something went wrong");
        } else {
          yield HomeBlocLoaded(drinks: model.drinks);
        }
      }
      if (event is SearchDrink) {
        yield HomeBlocloading();
        DrinkListModel model =
            await DrinkListService.searchDrinkList(event.searchText);
        if (model == null) {
          yield HomeBlocError("Something went wrong");
        } else {
          yield HomeBlocLoaded(drinks: model.drinks);
        }
      }
    } catch (ex) {
      yield HomeBlocError(ex.toString().replaceAll("Exception: ", ""));
    }
  }
}
