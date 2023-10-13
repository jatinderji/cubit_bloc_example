import '../models/users_model.dart';

abstract class CubitUserStates {}

class CubitUsersLoading extends CubitUserStates {}

class CubitUsersLoaded extends CubitUserStates {
  List<UsersModel> users;
  CubitUsersLoaded({required this.users});
}
