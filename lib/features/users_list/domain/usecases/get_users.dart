import 'package:bilytica_assignment/core/error/failure.dart';
import 'package:bilytica_assignment/core/usecase/usecase.dart';
import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';
import 'package:bilytica_assignment/features/users_list/domain/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class GetUsers implements UseCase<List<User>, GetUsersParams> {
  final UserRepository userRepository;
  GetUsers({required this.userRepository});
  @override
  Future<Either<Failure, List<User>>> call(GetUsersParams params) async {
    return await userRepository.getUsers(page: params.page);
  }
}

class GetUsersParams extends Equatable {
  final int page;

  const GetUsersParams({required this.page});

  @override
  List<Object?> get props => [page];
}
