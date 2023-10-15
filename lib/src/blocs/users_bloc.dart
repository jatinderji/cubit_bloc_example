import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/users_model.dart';
import '../repositories/users_repo.dart';
import 'users_bloc_events.dart';
import 'users_bloc_states.dart';

class UsersBloc extends Bloc<BlocUserEvent, BlocUserStates> {
  final UsersRepo usersRepo = UsersRepo();

  UsersBloc() : super(BlocUsersLoadingState()) {
    on((event, emit) async {
      List<UsersModel> users = await usersRepo.getUsers();
      emit(BlocUsersLoadedState(users: users));
    });

    add(BlocUsersInitialEvent());
  }
}
