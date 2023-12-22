import 'package:flutter/material.dart';
import 'package:wit_by_bit/utils/assets.dart';
import 'package:wit_by_bit/utils/common_codes.dart';
import 'package:wit_by_bit/utils/routes.dart';
import 'package:wit_by_bit/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushNamed(RouteName.homeScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: assetImage(
          AppAssets.bun1,
          height: 160.setHeight(),
          width: 160.setHeight(),
        ),
      ),
    );
  }
}
