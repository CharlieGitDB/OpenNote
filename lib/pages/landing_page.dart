import 'package:flutter/material.dart';
import 'package:openote/model/document.dart';
import 'package:openote/model/documenttype.dart';
import 'package:openote/ui/search_bar.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:uuid/uuid.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSearchBar(),
      body: SingleChildScrollView(
        child: Column(
          children: getDocumentsWidget(),
        )
      ),
      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.green,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.edit),
        childButtons: _getUnicornButtons(),
      ),
    );
  }
}

List<UnicornButton> _getUnicornButtons() {
  List<UnicornButton> buttons = List();
  buttons.add(
    UnicornButton(
      hasLabel: true,
      labelText: "New Note",
      currentButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.event_note),
        mini: true,
        onPressed: () {},
      ),
    )
  );

  buttons.add(
    UnicornButton(
      hasLabel: true,
      labelText: "New Checklist",
      currentButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.check_box),
        mini: true,
        onPressed: () {},
      ),
    )
  );

  return buttons;
}

List<Document> getDocuments() {
  List<Document> di = List();
  for (int i = 0; i < 100; i ++) {
    DocumentType dt = (i % 2 == 0 ? DocumentType.list : DocumentType.note);
    di.add(Document(Uuid().v4().toString(), i.toString(), dt, "date"));
  }
  
  return di;
}

List<Widget> getDocumentsWidget() {
  List<Widget> widgets = List();
  List<Document> docs = getDocuments();
  docs.forEach((d) => {
    widgets.add(Card(
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
          ListTile(
            leading: (d.type == DocumentType.list ? Icon(Icons.event_note) : Icon(Icons.check_box)),
            title: Text(d.name),
            subtitle: Text(d.date)
          ),
       ],
     ) 
    ))
  });

  return widgets;
}