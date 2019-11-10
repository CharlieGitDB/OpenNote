import 'package:flutter/material.dart';
import 'package:openote/ui/search_bar.dart';


class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getLandingBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: getListTiles(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "newListItemBtn",
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

AppBar getLandingBar(context) {
  return AppBar(
    backgroundColor: Colors.green,
    leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      Navigator.pop(context);
    }),
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
        decoration: BoxDecoration(
          color: Colors.green[200],
          borderRadius: BorderRadius.all(Radius.circular(22.0))
        ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search..",
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(Icons.search, color: Colors.white)
                  ),
                ),
              )
            ),
          ],
        )
    )
  );
}

List<CheckboxListTile> getListTiles() {
  List<CheckboxListTile> checkboxListTiles = List();
  for (int i = 0; i < 22; i++) {
    checkboxListTiles.add(
      CheckboxListTile(
        title: Text("list $i"),
        value: (i % 2 == 0),
        activeColor: Colors.green,
        onChanged: (bool isChecked) {}
      )
    );
  }

  return checkboxListTiles;
}