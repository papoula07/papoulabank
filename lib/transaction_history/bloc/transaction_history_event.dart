part of 'transaction_history_bloc.dart';

@immutable
abstract class TransactionHistoryEvent {}


class InitialTransactionHistoryEvent extends TransactionHistoryEvent{}


class AddTransactionHistoryEvent extends TransactionHistoryEvent{}