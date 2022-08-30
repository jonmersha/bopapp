class DetailServiceModel {
   late List<ServiceDetail> _serviceDetail;
   List<ServiceDetail> get serviceDetail=>_serviceDetail;
  DetailServiceModel({required serviceDetail});
  DetailServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['serviceDetail'] != null) {
      _serviceDetail = <ServiceDetail>[];
      json['serviceDetail'].forEach((v) {
        _serviceDetail.add(new ServiceDetail.fromJson(v));
      });
    }
  }

}

class ServiceDetail {
  int? documentID;
  int? sectionId;
  String? sectionName;
  String? sectionDescription;
  String? documentPath;

  ServiceDetail(
      {this.documentID,
        this.sectionId,
        this.sectionName,
        this.sectionDescription,
        this.documentPath});

  ServiceDetail.fromJson(Map<String, dynamic> json) {
    documentID = json['documentID'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    sectionDescription = json['sectionDescription'];
    documentPath = json['documentPath'];
  }


}
