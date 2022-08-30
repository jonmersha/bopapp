class ServiceModel {
  late List<Service> _service;
  List<Service> get service=>_service;


  ServiceModel({required service});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['service'] != null) {
      _service = <Service>[];
      json['service'].forEach((v) {
        service.add(new Service.fromJson(v));
      });
    }
  }


}

class Service {
  int? serviceID;
  String? serviceName;
  String? serviceDescription;
  String? serviceIconPath;
  String? serviceCreateTime;
  int? serviceCreator;

  Service(
      {this.serviceID,
        this.serviceName,
        this.serviceDescription,
        this.serviceIconPath,
        this.serviceCreateTime,
        this.serviceCreator});

  Service.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    serviceDescription = json['serviceDescription'];
    serviceIconPath = json['serviceIconPath'];
    serviceCreateTime = json['serviceCreateTime'];
    serviceCreator = json['serviceCreator'];
  }


}


