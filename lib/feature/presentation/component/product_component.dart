import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.rate,
  });

  final String image;
  final String name;
  final String description;
  final String price;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 250.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Image And Heart Icon
            Stack(
              children: [
                // Image And Error Image
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          height: 80.h,
                          width: double.infinity,
                        )
                      : const Icon(
                          Icons.error,
                          size: 25,
                        ),
                ),

                // Heart Icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          color: AppColors.primary,
                          Icons.favorite_border,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name Product
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  // Desc Product
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  // Price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'EGP: $price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColors.primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  // Rating
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Review ($rate)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColors.primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.star,
                          size: 20.sp,
                          color: AppColors.yellow,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 19.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
