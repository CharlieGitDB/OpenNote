import 'package:flutter/material.dart';
import 'package:openote/model/document.dart';
import 'package:openote/model/documenttype.dart';
import 'package:openote/ui/search_bar.dart';
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
      )
    );
  }
}

class DocumentDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          child: Column(
            children: getDocumentsWidget()
          )
        )
      ],
    );
  }

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
    // widgets.add(Row(
    //   children: <Widget>[
    //     Expanded(
    //       child: Text(d.name)
    //     ),
    //     Expanded(
    //       child: Text(d.date)
    //     )
    //   ],
    // ))

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