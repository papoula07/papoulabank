import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionScreen extends StatelessWidget{
  const TransactionScreen({super.key});

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
          TextFormField(
            key: Key('SendMoneyField'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),],
            decoration: InputDecoration(
              icon: Icon(Icons.money),
              hintText: 'Enter Amount to Send',
            ),
          ),
          TextFormField(
            key: Key('SendToUserField'),
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter Account Name',
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

}