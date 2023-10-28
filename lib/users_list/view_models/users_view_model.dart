import 'package:flutter/material.dart';
import 'package:mvvm_app/users_list/model/user_error.dart';
import 'package:mvvm_app/users_list/model/users_list_model.dart';
import 'package:mvvm_app/users_list/repo/api.status.dart';
import 'package:mvvm_app/users_list/repo/user_services.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  Future<bool> addUser() async {
    if (!isValid()) {
      return false;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  bool isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }

    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }

    return true;
  }

  void setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  UserViewModel() {
    getUsers();
  }

  void setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  void setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  void setUserError(UserError userError) {
    _userError = userError;
  }

  void getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    } else if (response is Failure) {
      UserError userError = UserError(
          code: response.code, message: response.errorResponse.toString());
      setUserError(userError);
    }

    setLoading(false);
  }
}
