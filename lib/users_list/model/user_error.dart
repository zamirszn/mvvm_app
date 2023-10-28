import 'package:mvvm_app/users_list/repo/api.status.dart';

class UserError {
  int? code;
  String message;

  UserError({required this.code, required this.message});
}
