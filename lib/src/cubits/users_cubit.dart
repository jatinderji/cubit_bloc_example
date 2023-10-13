import '../models/users_model.dart';

import '../repositories/users_repo.dart';

import 'cubit_users_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<CubitUserStates> {
  final UsersRepo usersRepo = UsersRepo();

  UsersCubit() : super(CubitUsersLoading()) {
    getData();
  }

  getData() async {
    List<UsersModel> users = await usersRepo.getUsers();
    emit(CubitUsersLoaded(users: users));
  }
}
