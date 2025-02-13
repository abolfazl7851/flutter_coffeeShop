import 'package:coffee_shop/CoffeeShopFeature/presentation/bloc/Home/home_bloc.dart';
import 'package:coffee_shop/locator.dart';
import 'package:coffee_shop/screens/main_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CoffeeShopFeature/presentation/bloc/sign_up_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<SignUpBloc>()),
          BlocProvider(create: (_) => locator<HomeBloc>()),
        ],
        child: const MainWrapper()),
  ));
}
