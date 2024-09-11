// ignore: unused_import
import 'dart:math';

import 'package:aplikasi_sederhana/presentation/cart/widgets/cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Loaded([])) {
    on<_AddProduct>((event, emit) {
      final currentState = state as _Loaded;
      final index = currentState.data
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.data[index].quantity += 1;
        emit(const _Loading());
        emit(_Loaded(currentState.data));
      } else {
        // emit(const _Loading());
        emit(_Loaded([...currentState.data, event.cart]));
      }
    });
    on<_RemoveProduct>((event, emit) {
      final currentState = state as _Loaded;
      final index = currentState.data
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.data[index].quantity -= 1;

        if (currentState.data[index].quantity <= 0) {
          currentState.data.removeAt(index);
        }
        emit(const _Loading());
        emit(_Loaded(currentState.data));
      }
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Loaded([]));
    });
  }
}
