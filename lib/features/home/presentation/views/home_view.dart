import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie/core/di/di.dart';
import 'package:listie/features/home/presentation/manager/cubit/fetch_products_cubit.dart';
import 'package:listie/features/home/presentation/views/widgets/products/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        title: Text(
          "Shopping App",
          style: const TextStyle().copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<FetchProductsCubit>()..fetchProducts(),
        child: const HomeViewBody(),
      ),
    );
  }
}
