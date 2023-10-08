import 'package:either_dart/either.dart';
import 'package:kesl/model/shop_model.dart';
import 'package:http/http.dart' as http;

class ApiForshopDetails {
  Future<Either<String, ShopModell>> getDataFromAPi() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://kezel.co/api/getAllDigitalMenu.php'));
    request.fields.addAll({'restaurant': 'LeisureInnVKL'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      print(res);
      return Right(shopModellFromJson(res));
    } else {
      return const Left('Something went wrong');
    }
  }
}
