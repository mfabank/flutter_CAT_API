import 'package:http/http.dart';

class Network {
  final String url;

  Network(this.url);

  Future getData() async{
    print('Calling URI : $url');
    Response response = await get(url);

    if(response.statusCode == 200 ) {
      return response.body;
    }
    else {
      print(response.statusCode);
    }
  }
}