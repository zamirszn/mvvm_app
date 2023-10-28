import 'dart:convert';
import 'dart:io';

import 'package:mvvm_app/users_list/model/users_list_model.dart';
import 'package:mvvm_app/users_list/repo/api.status.dart';
import 'package:mvvm_app/utils/constants.dart';
import "package:http/http.dart" as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (SUCCESS == response.statusCode) {
        return Success(response: userListModelFromJson(response.body));
      }
      return Failure(
          errorResponse: "Invalid Response", code: USER_INVALID_RESPONSE);
    } on SocketException {
      return Failure(errorResponse: "No internet", code: NO_INTERENET);
    } on HttpException {
      return Failure(errorResponse: "No internet", code: NO_INTERENET);
    } on FormatException {
      return Failure(errorResponse: "Invalid Format", code: INVALID_FORMAT);
    } catch (e) {
      return Failure(errorResponse: "Unknown Error", code: UNKNOWN_ERROR);
    }
  }
}
