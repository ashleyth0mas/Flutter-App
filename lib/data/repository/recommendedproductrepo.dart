import 'package:get/get.dart';
import 'package:tasty/data/api/apiclient.dart';
import 'package:tasty/widgets/appconstants.dart';

class Recommendedproductrepo extends GetxService {
  final apiclient Apiclient;                                //Apiclient=object of apiclient class inorder to call its function
   
  Recommendedproductrepo({required this.Apiclient});
  Future<Response> getProductlist() async {
    return await Apiclient.getdata(Appconstants.RECOMMENDED_PRODUCTURL); //endpoint url is required
  }
}
//repos are used to pass api url to apilclient