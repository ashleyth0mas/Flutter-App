import 'package:get/get.dart';
import 'package:tasty/data/api/apiclient.dart';
import 'package:tasty/widgets/appconstants.dart';

class Productrepo extends GetxService {
  final apiclient Apiclient;                               
   
  Productrepo({required this.Apiclient});
  Future<Response> getProductlist() async {
    return await Apiclient.getdata(Appconstants.POPULARPRODUCTURL); 
  }
}
