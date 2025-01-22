import 'package:bilytica_assignment/core/network/connection_checker.dart';
import 'package:bilytica_assignment/features/users_list/data/datasources/user_remote_datasource.dart';
import 'package:bilytica_assignment/features/users_list/data/repository/user_repository_impl.dart';
import 'package:bilytica_assignment/features/users_list/domain/repository/user_repository.dart';
import 'package:bilytica_assignment/features/users_list/domain/usecases/get_users.dart';
import 'package:bilytica_assignment/features/users_list/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'init_dependencies.main.dart';
