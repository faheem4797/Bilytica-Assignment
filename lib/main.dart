// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bilytica_assignment/core/theme/theme.dart';
import 'package:bilytica_assignment/features/users_list/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:bilytica_assignment/features/users_list/presentation/pages/users_list.dart';
import 'package:bilytica_assignment/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) =>
      BlocProvider(
          create: (_) =>
              serviceLocator<GetUsersBloc>()..add(const FetchUsers()),
          child: const MyApp())
      //)
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bilytica Assignment',
      theme: AppTheme.lightThemeMode,
      home: const UsersList(),
    );
  }
}
