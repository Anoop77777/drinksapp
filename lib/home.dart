import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_intervel_test/bloc/home_bloc/home_bloc_bloc.dart';
import 'package:team_intervel_test/common/product_card.dart';
import 'package:team_intervel_test/common/search.dart';
import 'package:team_intervel_test/details.dart';
import 'package:team_intervel_test/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearchActive = false;
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearchState({BuildContext context}) {
    setState(() {
      _isSearchActive = !_isSearchActive;
    });
    if (_isSearchActive) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    } else {
      BlocProvider.of<HomeBlocBloc>(context).add(GetDrink());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context: context),
      body: BlocBuilder<HomeBlocBloc, HomeBlocState>(
        builder: (context, state) {
          if (state is HomeBlocInitial) {
            BlocProvider.of<HomeBlocBloc>(context).add(GetDrink());
          }
          if (state is HomeBlocloading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomeBlocError) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is HomeBlocLoaded) {
            return GridView.builder(
                padding: EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: state.drinks.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      nextScreen(
                          context,
                          DetailsPage(
                            drink: state.drinks[index],
                          ));
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  state.drinks[index].strDrinkThumb),
                              fit: BoxFit.cover),
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          //  color: Colors.white,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Text(state.drinks[index].strDrink)),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }

  AppBar _buildAppbar({BuildContext context}) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: false,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: _isSearchActive
          ? SearchComponent(
              controller: _searchController,
              focusNode: _searchFocusNode,
              onEditingComplete: () => _searchEvents(),
            )
          : Text("Home", style: Theme.of(context).textTheme.headline6),
      actions: <Widget>[
        _isSearchActive
            ? IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  _toggleSearchState(context: context);
                  setState(() {
                    _searchController.clear();
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () => _toggleSearchState(context: context),
              ),
      ],
    );
  }

  void _searchEvents() async {
    BlocProvider.of<HomeBlocBloc>(context)
        .add(SearchDrink(searchText: _searchController.text));
  }
}
