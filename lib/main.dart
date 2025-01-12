import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papoulabank/repositories/login_repository.dart';
import 'package:papoulabank/transaction/transaction_screen.dart';

import 'login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PapoulaBank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        // home: TransactionScreen()
      home: RepositoryProvider(
        create: (context) => LoginRepository(),
        child: LoginScreen(),
      ),
    );
  }
}
