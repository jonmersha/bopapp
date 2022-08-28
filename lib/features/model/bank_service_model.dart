
class ServiceModel {

  late List<Service> _service;
  List<Service> get service=>_service;
  ServiceModel({required service}){
    _service=service;
  }

  ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['service'] != null) {
      _service = <Service>[];
      json['service'].forEach((v) {
        service.add(Service.fromJson(v));
      });
    }
  }

}

class Service {
  String? id;
  String? name;
  String? description;
  String? image;

  Service({this.id, this.name, this.description, this.image});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }


}



