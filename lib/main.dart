import 'package:flutter/material.dart';
import 'package:mvvm_app/users_list/view/home_screen.dart';
import 'package:mvvm_app/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => UserViewModel(), )
      ],
      child: const MaterialApp(
        home: HomeScreen()
      ),
    ); 
  }
}
