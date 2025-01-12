import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papoulabank/transaction/transaction_screen.dart';
import 'package:papoulabank/transaction_history/transaction_history_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.logout),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(!isToggled ? 'PHP 500.000' : 'PHP * * * * * *'),
              GestureDetector(
                child: Icon(isToggled
                    ? CupertinoIcons.eye_fill
                    : CupertinoIcons.eye_slash_fill),
                onTap: () {
                  setState(() {
                    isToggled = !isToggled;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionScreen(),
                ),
              );
            },
            child: Text('Send Money'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionHistoryScreen(),
                ),
              );
            },
            child: Text('View Transactions'),
          ),
        ],
      ),
    );
  }
}
