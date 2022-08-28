import 'package:bop/features/data/repository/ServiceRepository.dart';
import 'package:bop/features/model/bank_service_model.dart';
import 'package:get/get.dart';

class BranchServiceController extends GetxController{
  final ServiceRepository serviceRepo;

  BranchServiceController({required this.serviceRepo});
  List<dynamic> _serviceList=[];
  List<dynamic> get serviceList=>_serviceList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  Future<void> getRecommendedProductList() async{
    Response response = await serviceRepo.getRecommendedProductList();
    if(response.statusCode==200){
      //print("got Products====================================");
      _serviceList=[];
     _serviceList.addAll(ServiceModel.fromJson(response.body).service);
      _isLoaded=true;
      print(response.body);
      update();
    }else{
      print(response.statusText);

    }


  }


}