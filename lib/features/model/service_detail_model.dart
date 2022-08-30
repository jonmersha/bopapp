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
  int? serviceID;
  int? parentServcieID;
  String? serviceName;
  String? seviceDescription;
  String? lOANDESC;

  ServiceDetail(
      {this.serviceID,
        this.parentServcieID,
        this.serviceName,
        this.seviceDescription,
        this.lOANDESC});

  ServiceDetail.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    parentServcieID = json['parentServcieID'];
    serviceName = json['serviceName'];
    seviceDescription = json['seviceDescription'];
    lOANDESC = json['LOAN_DESC'];
  }


}