import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papoulabank/transaction_history/bloc/transaction_history_bloc.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final TransactionHistoryBloc postsBloc = TransactionHistoryBloc();

  @override
  void initState() {
    postsBloc.add(InitialTransactionHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.logout),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<TransactionHistoryBloc, TransactionHistoryState>(
        bloc: postsBloc,
        listenWhen: (previous, current) =>
            current is TransactionHistoryActionState,
        buildWhen: (previous, current) =>
            current is! TransactionHistoryActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case TransactionHistoryFetchingLoadingState _:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case TransactionHistorySuccessState _:
              final successState = state as TransactionHistorySuccessState;

              return ListView.builder(
                itemCount: successState.transactionHistoryModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successState.transactionHistoryModel[index].title),
                        Text(successState.transactionHistoryModel[index].body)
                      ],
                    ),
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
