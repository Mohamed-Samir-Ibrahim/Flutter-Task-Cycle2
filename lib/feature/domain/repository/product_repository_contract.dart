import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../data/model/product_model.dart';

abstract class ProductRepositoryContract {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
