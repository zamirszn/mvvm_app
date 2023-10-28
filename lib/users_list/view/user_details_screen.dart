import 'package:flutter/material.dart';
import 'package:mvvm_app/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userViewModel.selectedUser?.name ?? "",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          Text(
            userViewModel.selectedUser?.email ?? "",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
