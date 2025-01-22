import 'package:bilytica_assignment/core/utils/show_snackbar.dart';
import 'package:bilytica_assignment/features/users_list/presentation/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:bilytica_assignment/features/users_list/presentation/widgets/search_bar_widget.dart';
import 'package:bilytica_assignment/features/users_list/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Scaffold(
          body: BlocConsumer<GetUsersBloc, GetUsersState>(
              listener: (context, state) {
        if (state.getUsersStatus == GetUsersStatus.failure &&
            state.errorMessage != null) {
          showSnackBar(context, state.errorMessage!);
        }
      }, builder: (context, state) {
        return state.getUsersStatus == GetUsersStatus.loading &&
                state.users.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : state.getUsersStatus == GetUsersStatus.failure &&
                    state.users.isEmpty
                ? Center(
                    child: Text(state.errorMessage ?? ''),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        const SearchBarWidget(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.users.length,
                            shrinkWrap: false,
                            itemBuilder: (context, index) {
                              // starts fetching data again when second last item is comes on screen
                              if (index == state.users.length - 2) {
                                context
                                    .read<GetUsersBloc>()
                                    .add(const FetchUsers());
                              }
                              final user = state.users[index];
                              return UserCard(
                                user: user,
                                index: index,
                                listLength: state.users.length,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
      })),
    );
  }
}
