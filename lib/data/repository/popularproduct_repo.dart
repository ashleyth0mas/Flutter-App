import 'package:get/get.dart';
import 'package:tasty/data/api/apiclient.dart';
import 'package:tasty/widgets/appconstants.dart';

class Productrepo extends GetxService {
  final apiclient Apiclient;                                //Apiclient=object of apiclient class inorder to call its function
   
  Productrepo({required this.Apiclient});
  Future<Response> getProductlist() async {
    return await Apiclient.getdata(Appconstants.POPULARPRODUCTURL); //endpoint url is required
  }
}
//repos are used to pass api url to apilclient