// ignore: unused_import
import 'dart:math';

import 'package:aplikasi_sederhana/presentation/home/navbar/screen/navbar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/components/button.dart';
import '../../../../data/datasource/auth_local_datasource.dart';
import '../../../../data/model/request/login_request_model.dart';
import '../../bloc/login/login_bloc.dart';

// ignore: must_be_immutable
class LoginEmailPasswordButton extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginEmailPasswordButton(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loaded: (data) async {
              // Cetak data ke konsol
              // ignore: avoid_print
              print('Loaded data: ${data.token}');
              // ignore: avoid_print
              print('Loaded data: ${data.user}');
              AuthLocalDataSource().saveAuthData(data);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavbarView(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login success'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                  backgroundColor: Colors.red,
                ),
              );
            });
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Button.filled(
              onPressed: () {
                final data = LoginRequestModel(
                  email: email.text,
                  password: password.text,
                );
                context.read<LoginBloc>().add(LoginEvent.login(data));
              },
              label: 'Masuk',
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
