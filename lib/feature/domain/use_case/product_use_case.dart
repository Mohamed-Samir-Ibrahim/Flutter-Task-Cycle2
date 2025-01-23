import 'package:dartz/dartz.dart';
import 'package:flutter_task_cycle2/core/error/failure.dart';
import 'package:flutter_task_cycle2/core/usecase/base_usecase.dart';
import '../../data/model/product_model.dart';
import '../repository/product_repository_contract.dart';

class ProductUseCase extends BaseUseCase<List<ProductModel>, NoParameters> {
  final ProductRepositoryContract productRepositoryContract;

  ProductUseCase(this.productRepositoryContract);

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParameters parameters) {
    Future<Either<Failure, List<ProductModel>>> result =
        productRepositoryContract.getProducts();
    return result;
  }
}
