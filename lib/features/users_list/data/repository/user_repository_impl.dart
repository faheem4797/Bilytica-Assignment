import 'package:bilytica_assignment/core/constants/constants.dart';
import 'package:bilytica_assignment/core/error/failure.dart';
import 'package:bilytica_assignment/core/error/server_exception.dart';
import 'package:bilytica_assignment/core/network/connection_checker.dart';
import 'package:bilytica_assignment/features/users_list/data/datasources/user_remote_datasource.dart';
import 'package:bilytica_assignment/features/users_list/data/models/user_model.dart';
import 'package:bilytica_assignment/features/users_list/domain/entities/user.dart';
import 'package:bilytica_assignment/features/users_list/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;
  final ConnectionChecker connectionChecker;

  UserRepositoryImpl(
      {required this.userRemoteDatasource, required this.connectionChecker});

  @override
  Future<Either<Failure, List<User>>> getUsers({required int page}) async {
    try {
      //Checks if internet connection is available
      if (!await connectionChecker.isConnected) {
        return left(const Failure(Constants.noConnectionErrorMessage));
      }
      final responseData = await userRemoteDatasource.fetchUsers(page);
      final listOfUsers =
          responseData.map((json) => UserModel.fromMap(json)).toList();
      return right(listOfUsers);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (_) {
      return left(const Failure());
    }
  }
}
