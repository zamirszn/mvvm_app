import 'package:flutter/material.dart';
import 'package:mvvm_app/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUsersScreen extends StatelessWidget {
  const AddUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: IconButton.outlined(
          onPressed: () async {
            bool userAdded = await userViewModel.addUser();
            if (!userAdded) {
              return;
            }
            Navigator.pop(context);
          },
          icon: const Icon(Icons.save_outlined)),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Name"),
            onChanged: (value) async {
              userViewModel.addingUser.name = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Email"),
            onChanged: (value) async {
              userViewModel.addingUser.email = value;
            },
          )
        ],
      ),
    );
  }
}
