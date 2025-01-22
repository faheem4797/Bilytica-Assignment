part of 'get_users_bloc.dart';

enum GetUsersStatus { loading, success, failure }

final class GetUsersState extends Equatable {
  const GetUsersState({
    this.users = const [],
    this.page = 1,
    this.getUsersStatus = GetUsersStatus.loading,
    this.errorMessage,
  });

  final List<User> users;
  final int page;
  final GetUsersStatus getUsersStatus;
  final String? errorMessage;

  @override
  List<Object?> get props => [users, page, getUsersStatus, errorMessage];

  GetUsersState copyWith({
    List<User>? users,
    int? page,
    GetUsersStatus? getUsersStatus,
    String? errorMessage,
  }) {
    return GetUsersState(
      users: users ?? this.users,
      page: page ?? this.page,
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
