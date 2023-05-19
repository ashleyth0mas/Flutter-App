import 'package:get/get.dart';
import 'package:tasty/widgets/appconstants.dart';

class apiclient extends GetConnect implements GetxService {
  late String token;
  final String appUrl;
  late Map<String, String> headers;
  apiclient({required this.appUrl}) {
    baseUrl = appUrl;
    timeout = const Duration(seconds: 30);
    token = Appconstants.TOKEN;
    headers = {

      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getdata( String url,
  ) async {
                                            
   
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
