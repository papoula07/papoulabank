import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:papoulabank/models/transaction_model.dart';
import 'package:papoulabank/repositories/transaction_repository.dart';

part 'transaction_history_event.dart';
part 'transaction_history_state.dart';

class TransactionHistoryBloc extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc() : super(TransactionHistoryInitial()) {
    on<InitialTransactionHistoryEvent>(postsInitialFetchEvent);
    on<AddTransactionHistoryEvent>(transactionHistoryAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      InitialTransactionHistoryEvent event, Emitter<TransactionHistoryState> emit) async {
    emit(TransactionHistoryFetchingLoadingState());
    List<TransactionDataModel> posts = await TransactionsRepo.fetchTransactions();

    emit(TransactionHistorySuccessState(transactionHistoryModel: posts));
  }

  FutureOr<void> transactionHistoryAddEvent(
      AddTransactionHistoryEvent event, Emitter<TransactionHistoryState> emit) async {
    bool success = await TransactionsRepo.addTransaction();

    if (success) {
      emit(TransactionHistoryAdditionSuccessState());
    } else {
      emit(TransactionHistoryAdditionErrorState());
    }
  }
}