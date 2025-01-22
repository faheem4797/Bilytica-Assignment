import 'package:bilytica_assignment/core/constants/constants.dart';
import 'package:bilytica_assignment/core/error/server_exception.dart';
import 'package:dio/dio.dart';

abstract interface class UserRemoteDatasource {
  Future<List<dynamic>> fetchUsers(
    int page,
  );
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final Dio dio;

  UserRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<dynamic>> fetchUsers(int page) async {
    try {
      final response = await dio.get(
        Constants.baseApiUrl,
        queryParameters: {
          'page': page,
          'results': Constants.apiResultNumber,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data['results'] as List<dynamic>;

        return responseData;
      } else {
        throw ServerException(
            'Error fetching users. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ServerException('Dio error occurred: ${e.message}');
    }
  }
}
