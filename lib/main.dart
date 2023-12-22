import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wit_by_bit/bloc/home/home_bloc.dart';
import 'package:wit_by_bit/utils/colors.dart';
import 'package:wit_by_bit/utils/routes.dart';
import 'package:wit_by_bit/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          dividerColor: AppColors.colorDDDDDD,
          dividerTheme: const DividerThemeData(
            color: AppColors.colorDDDDDD,
            thickness: 1,
            space: 0,
          ),
        ),
        routes: Routes.routes,
        initialRoute: RouteName.splashScreen,
      ),
    );
  }
}
