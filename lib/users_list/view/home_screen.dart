import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/components/app_error.dart';
import 'package:mvvm_app/components/app_loading.dart';
import 'package:mvvm_app/users_list/model/users_list_model.dart';
import 'package:mvvm_app/users_list/view_models/users_view_model.dart';
import 'package:mvvm_app/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: IconButton.outlined(
          onPressed: () {
            openAddUser(context);
          },
          icon: const Icon(Icons.add)),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _ui(userViewModel),
            ],
          )),
    );
  }

  Widget _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoading();
    }
    if (userViewModel.userError != null) {
      return AppError(
        errorText: userViewModel.userError!.message,
      );
    }

    return Expanded(
        child: ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: userViewModel.userListModel.length,
      itemBuilder: (context, index) {
        UserModel userModel = userViewModel.userListModel[index];

        return InkWell(
          onTap: () async {
            userViewModel.setSelectedUser(userModel);
            openUserDetail(context);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.name ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  userModel.email ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ]),
        );
      },
    ));
  }
}
