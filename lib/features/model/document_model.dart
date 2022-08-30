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
  int? documentID;
  String? documentName;
  String? documentDescription;
  String? documentPath;
  String? documentImagePath;
  int? isPublic;
  String? documentCategory;
  String? uploadDate;

  Document(
      {this.documentID,
        this.documentName,
        this.documentDescription,
        this.documentPath,
        this.documentImagePath,
        this.isPublic,
        this.documentCategory,
        this.uploadDate});

  Document.fromJson(Map<String, dynamic> json) {
    documentID = json['documentID'];
    documentName = json['documentName'];
    documentDescription = json['documentDescription'];
    documentPath = json['documentPath'];
    documentImagePath = json['documentImagePath'];
    isPublic = json['isPublic'];
    documentCategory = json['documentCategory'];
    uploadDate = json['uploadDate'];
  }


}
