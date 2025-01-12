import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:papoulabank/models/transaction_model.dart';

class TransactionsRepo {
  static Future<List<TransactionDataModel>> fetchTransactions() async {
    var client = http.Client();
    List<TransactionDataModel> transactions = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        TransactionDataModel transaction =
        TransactionDataModel.fromMap(result[i] as Map<String, dynamic>);
        transactions.add(transaction);
      }

      return transactions;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addTransaction() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "a",
        "body": "b",
        "userId": "1"
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}