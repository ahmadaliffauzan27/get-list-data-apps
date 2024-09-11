import 'package:aplikasi_sederhana/presentation/auth/bloc/login/login_bloc.dart';
import 'package:aplikasi_sederhana/presentation/auth/login/screen/login_page.dart';
import 'package:aplikasi_sederhana/presentation/home/navbar/screen/navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasource/auth_local_datasource.dart';
import 'presentation/cart/bloc/bloc/cart_bloc.dart';
import 'presentation/home/bloc/product/product_bloc.dart';
import 'presentation/users/bloc/bloc/users_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) =>
                ProductBloc()..add(const ProductEvent.loadProducts()),
          ),
          BlocProvider(
            create: (context) => UsersBloc(),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FutureBuilder<bool>(
            future: AuthLocalDataSource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!) {
                return const NavbarView();
              } else {
                return const LoginPage();
              }
            },
          ),
        ));
  }
}
