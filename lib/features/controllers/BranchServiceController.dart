import 'package:bop/features/data/repository/ServiceRepository.dart';
import 'package:bop/features/model/service_detail_model.dart';
import 'package:bop/features/model/service_model.dart';
import 'package:get/get.dart';

class BranchServiceController extends GetxController{
  final ServiceRepository serviceRepo;

  BranchServiceController({required this.serviceRepo});
  List<dynamic> _serviceList=[];
  List<dynamic> get serviceList=>_serviceList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;


  Future<void> getServiceList() async{
    Response response = await serviceRepo.getRecommendedProductList();
    if(response.statusCode==200){
      //print("got Products====================================");
      _serviceList=[];
     _serviceList.addAll(ServiceModel.fromJson(response.body).service);
      _isLoaded=true;
      //print(response.body);
      update();
    }else{
      print(response.statusText);

    }

  }

  Future<void> getServiceListByID() async{
    Response response = await serviceRepo.getRecommendedProductList();
    if(response.statusCode==200){
      //print("got Products====================================");
      _serviceList=[];
      _serviceList.addAll(ServiceModel.fromJson(response.body).service);
      _isLoaded=true;
      //print(response.body);
      update();
    }else{
      print(response.statusText);

    }

  }
  Future<void> getServiceListDetailByID(int id) async{
    Response response = await serviceRepo.getServiceListDetailByID(id);
    if(response.statusCode==200){
      _serviceList=[];
      _serviceList.addAll(DetailServiceModel.fromJson(response.body).serviceDetail);
      _isLoaded=true;
      update();
    }else{
      print(response.statusText);

    }

  }



}