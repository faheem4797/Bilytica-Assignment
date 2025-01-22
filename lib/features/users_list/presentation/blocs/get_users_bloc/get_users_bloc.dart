import 'dart:async';

import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';
import 'package:bilytica_assignment/features/users_list/domain/usecases/get_users.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final GetUsers _getUsers;
  GetUsersBloc({required GetUsers getUsers})
      : _getUsers = getUsers,
        super(const GetUsersState()) {
    on<FetchUsers>(_fetchUsers);
  }

  FutureOr<void> _fetchUsers(
      FetchUsers event, Emitter<GetUsersState> emit) async {
    //returns in case data is already being fetched
    if (state.getUsersStatus == GetUsersStatus.loading && state.page != 1) {
      return;
    }
    emit(
      state.copyWith(
        getUsersStatus: GetUsersStatus.loading,
      ),
    );

    final response = await _getUsers(GetUsersParams(page: state.page));
    response.fold(
      (l) => emit(state.copyWith(
          getUsersStatus: GetUsersStatus.failure, errorMessage: l.message)),
      (r) => emit(state.copyWith(
          getUsersStatus: GetUsersStatus.success,
          users: List.from(state.users)..addAll(r),
          page: state.page +
              1)), // moves to next page in case of successful data fetching
    );
  }
}
