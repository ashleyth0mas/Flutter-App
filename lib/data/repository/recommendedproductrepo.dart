import 'package:get/get.dart';
import 'package:tasty/data/api/apiclient.dart';
import 'package:tasty/widgets/appconstants.dart';

class Recommendedproductrepo extends GetxService {
  final apiclient Apiclient;                            n
   
  Recommendedproductrepo({required this.Apiclient});
  Future<Response> getProductlist() async {
    return await Apiclient.getdata(Appconstants.RECOMMENDED_PRODUCTURL);
  }
}
