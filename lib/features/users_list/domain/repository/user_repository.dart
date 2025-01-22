import 'package:bilytica_assignment/core/error/failure.dart';
import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserRepository {
  Future<Either<Failure, List<User>>> getUsers({required int page});
}
