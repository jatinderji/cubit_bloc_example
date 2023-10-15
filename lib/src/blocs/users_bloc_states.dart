import '../models/users_model.dart';

abstract class BlocUserStates {}

class BlocUsersLoadingState extends BlocUserStates {}

class BlocUsersLoadedState extends BlocUserStates {
  List<UsersModel> users;
  BlocUsersLoadedState({required this.users});
}
