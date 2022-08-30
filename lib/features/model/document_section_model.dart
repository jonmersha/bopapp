class DocumentSectionModel {
  late List<Section> _section;
  List<Section> get section=>_section;

  DocumentSectionModel({required section});

  DocumentSectionModel.fromJson(Map<String, dynamic> json) {
    if (json['section'] != null) {
      _section = <Section>[];
      json['section'].forEach((v) {
        _section.add(new Section.fromJson(v));
      });
    }
  }
}

class Section {
  int? documentID;
  int? sectionId;
  String? sectionName;
  String? sectionDescription;
  String? documentPath;

  Section(
      {this.documentID,
        this.sectionId,
        this.sectionName,
        this.sectionDescription,
        this.documentPath});

  Section.fromJson(Map<String, dynamic> json) {
    documentID = json['documentID'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    sectionDescription = json['sectionDescription'];
    documentPath = json['documentPath'];
  }


}
