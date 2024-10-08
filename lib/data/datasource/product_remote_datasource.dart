import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/variables.dart';
import '../model/response/product_response_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/users?page=2'));
    if (response.statusCode == 200) {
      return right(ProductResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
