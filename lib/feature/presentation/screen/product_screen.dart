import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../component/product_component.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<ProductCubit>(context);
            return state is GetAllProductLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      // Products View
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.8),
                          itemCount: cubit.products.length,
                          itemBuilder: (context, index) {
                            return ProductComponent(
                              image: cubit.products[index].image.toString(),
                              name: cubit.products[index].title,
                              description: cubit.products[index].description,
                              price: cubit.products[index].price.toString(),
                              rate:
                                  cubit.products[index].rating.rate.toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
