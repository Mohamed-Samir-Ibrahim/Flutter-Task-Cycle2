import 'package:dio/dio.dart';
import 'package:flutter_task_cycle2/core/network/api_constants.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSourceContract {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSource implements ProductRemoteDataSourceContract {
  @override
  Future<List<ProductModel>> getProducts() async {
    final response =
        await Dio().get(ApiConstance.baseUrl + ApiConstance.endPoint);
    if (response.statusCode == 200) {
      return List<ProductModel>.from(
          response.data.map((x) => ProductModel.fromJson(x)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
