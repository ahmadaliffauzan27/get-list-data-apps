import 'package:aplikasi_sederhana/data/datasource/auth_remote_datasource.dart';
import 'package:aplikasi_sederhana/data/model/request/add_user_request_model.dart';
import 'package:aplikasi_sederhana/data/model/response/add_user_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const _Initial()) {
    on<_AddUser>((event, emit) async {
      emit(const _Loading());
      final response =
          await AuthRemoteDataSource().addUsers(AddUserRequestModel(
        name: event.name,
        job: event.job,
      ));
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
