import 'package:flutter/material.dart';
import 'package:openote/model/document.dart';
import 'package:openote/model/documenttype.dart';
import 'package:openote/pages/editor_page.dart';
import 'package:openote/pages/list_page.dart';
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
          children: getDocumentsWidget(context),
        )
      ),
      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.green,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.edit),
        childButtons: _getUnicornButtons(context),
      ),
    );
  }
}

List<UnicornButton> _getUnicornButtons(context) {
  List<UnicornButton> buttons = List();
  buttons.add(
    UnicornButton(
      hasLabel: true,
      labelText: "New Note",
      currentButton: FloatingActionButton(
        heroTag: "newDocumentBtn",
        backgroundColor: Colors.green,
        child: Icon(Icons.event_note),
        mini: true,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditorPage()),
            );
        },
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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListPage()),
            );
        },
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

List<Widget> getDocumentsWidget(context) {
  List<Widget> widgets = List();
  List<Document> docs = getDocuments();
  docs.forEach((d) => {
    widgets.add(
      InkWell(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                ListTile(
                  leading: (d.type == DocumentType.list ? Icon(Icons.check_box) : Icon(Icons.event_note)),
                  title: Text(d.name),
                  subtitle: Text(d.date)
                ),
            ],
          ), 
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => d.type == DocumentType.list ? ListPage() : EditorPage()),
            );
        },
    ))
  });

  return widgets;
}