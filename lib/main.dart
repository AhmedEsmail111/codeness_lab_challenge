import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listie/core/di/di.dart';
import 'package:listie/core/utils/my_bloc_observer.dart';
import 'package:listie/features/home/presentation/views/home_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const ListieApp());
}

class ListieApp extends StatelessWidget {
  const ListieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Listie Flutter challenge',
              home: HomeView(),
            ),
          );
        });
  }
}
