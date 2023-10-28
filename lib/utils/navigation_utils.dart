import 'package:flutter/material.dart';
import 'package:mvvm_app/users_list/view/add_users_screen.dart';
import 'package:mvvm_app/users_list/view/user_details_screen.dart';

void openUserDetail(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserDetailsScreen(),
      ));
}


void openAddUser(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddUsersScreen(),
      ));
}



