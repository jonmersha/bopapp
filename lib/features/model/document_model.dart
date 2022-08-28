class DocumentModel {
  late List<Document> _document;
  List<Document> get document =>_document;

  DocumentModel({required document}){
    _document=document;
  }

  DocumentModel.fromJson(Map<String, dynamic> json) {
    if (json['document'] != null) {
      _document = <Document>[];
      json['document'].forEach((v) {
        document.add(Document.fromJson(v));
      });
    }
  }


}

class Document {
  String? name;
  String? description;
  String? doc_path;
  String? image;

  Document({this.name, this.description,this.image,this.doc_path});

  Document.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    doc_path=json['doc_path'];
    description = json['description'];
    image = json['image'];
  }

}
