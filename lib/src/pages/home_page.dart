import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_users_states.dart';
import '../cubits/users_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit App'),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersCubit, CubitUserStates>(
        builder: (context, state) {
          if (state is CubitUsersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CubitUsersLoaded) {
            return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        state.users[index].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(state.users[index].email),
                    ),
                  ),
                ));
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
