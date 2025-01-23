import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_cycle2/feature/domain/repository/product_repository_contract.dart';
import 'package:flutter_task_cycle2/feature/presentation/cubit/product_state.dart';
import '../../data/model/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(ProductInitial());
  final ProductRepositoryContract productRepository;

  List<ProductModel> products = [];

  void getAllProduct() async {
    emit(GetAllProductLoadingState());

    final res = await productRepository.getProducts();
    res.fold(
      (l) => emit(GetAllProductErrorState()),
      (r) {
        products = r;
        emit(GetAllProductSuccessState());
      },
    );
  }
}
