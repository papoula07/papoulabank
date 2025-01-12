part of 'transaction_history_bloc.dart';

@immutable
abstract class TransactionHistoryState {}

abstract class TransactionHistoryActionState extends TransactionHistoryState {}

class TransactionHistoryInitial extends TransactionHistoryState {}

class TransactionHistoryFetchingLoadingState extends TransactionHistoryState {}

class TransactionHistoryFetchingErrorState extends TransactionHistoryState {}

class TransactionHistorySuccessState extends TransactionHistoryState {
  final List<TransactionDataModel> transactionHistoryModel;
  TransactionHistorySuccessState({
    required this.transactionHistoryModel,
  });
}

class TransactionHistoryAdditionSuccessState extends TransactionHistoryActionState{}


class TransactionHistoryAdditionErrorState extends TransactionHistoryActionState{}
