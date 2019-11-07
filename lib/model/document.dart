import 'package:openote/model/documenttype.dart';

class Document {
  String guid;
  String name;
  DocumentType type;
  String date;

  Document(this.guid, this.name, this.type, this.date);
}