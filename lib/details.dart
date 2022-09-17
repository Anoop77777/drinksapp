import 'package:flutter/material.dart';
import 'package:team_intervel_test/model/drink_list_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key, this.drink}) : super(key: key);
  final Drinks drink;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          widget.drink.strDrink,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 200,
              child: AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: widget.drink.idDrink,
                  child: Image.network(widget.drink.strDrinkThumb),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              widget.drink.strInstructions,
              maxLines: 3,
            ),
          ),
        ],
      )),
    );
  }
}
