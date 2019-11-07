import 'package:openote/model/documenttype.dart';

import 'document.dart';

class DocumentData extends Document {
  String data;

  DocumentData(String guid, String name, String date, DocumentType type, this.data) : super(guid, name, type, data);
}