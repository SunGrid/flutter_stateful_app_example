import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: "Stateful App Example",
        home: FavoriteCity(), //call StatefulWidget
      )
  );
}

/*Create a class that extends a StatefulWidget,
that returns a State in createState()
This class is Immutable*/
class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

/*_Private State class created with properties that may change
This class of State, with Widget build()  and setState( () {} ) is mutable*/
class _FavoriteCityState extends State<FavoriteCity> {

  String nameCity = "";  //defined property that may change in the future
  var _currencies = ["Dollars","Rupees", "Pounds", "Other"];
  var _currentItemSelected = "Rupees";

  @override
  Widget build(BuildContext context) {  //implement the build method

    //Build the Widget within Scaffold as the root Widget
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
              TextField(
                onSubmitted: (String userInput){
                 // onChanged: (String userInput){
                    setState( () {   //must call set state function with anonymous function
                      nameCity = userInput;
                  }); //setState()
                },
              ),

              DropdownButton<String>(

                items: _currencies.map(  //create map
                        (String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }
                ).toList(),  //convert to List

                onChanged: (String newValueSelected) {
                  _onDropDownItemSelected(newValueSelected);
                },

                value: _currentItemSelected,
              ),

              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "The city you entered is $nameCity",
                style: TextStyle(fontSize: 20.0),
              )),
            ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState( () {
      this._currentItemSelected = newValueSelected;
    });
  }

}