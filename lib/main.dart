import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'feature/presentation/cubit/product_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitDown,
  ]);
  ScreenUtil.ensureScreenSize();
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,child) {
          ScreenUtil.init(context);
          return BlocProvider(
            create:(context) => sl<ProductCubit>()..getAllProduct(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getAppTheme(),
              initialRoute: Routes.intitlRoute,
              onGenerateRoute: AppRoutes.generateRoute,
            ),
          );
        }
    );
  }
}