import 'package:dartz/dartz.dart';
import 'package:flutter_task_cycle2/core/error/failure.dart';
import 'package:flutter_task_cycle2/feature/data/model/product_model.dart';
import 'package:flutter_task_cycle2/feature/domain/repository/product_repository_contract.dart';
import '../../../core/error/exceptions.dart';
import '../data_source/product_remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepositoryContract {
  final ProductRemoteDataSourceContract productRemoteDataSourceContract;

  ProductRepositoryImpl(this.productRemoteDataSourceContract);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    final result = await productRemoteDataSourceContract.getProducts();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
