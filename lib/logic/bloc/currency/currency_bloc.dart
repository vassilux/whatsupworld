import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsupworld/model/currency.dart';
import 'package:whatsupworld/repository/currency_provider.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyProvider currencyProvider;

  CurrencyBloc(this.currencyProvider);

  @override
  CurrencyState get initialState => CurrencyEmpty();

  @override
  Stream<CurrencyState> mapEventToState(
    CurrencyEvent event,
  ) async* {
    if (event is FetchCurrency) {
      yield* _mapFetchCurrencyToState(event);
    }
  }

  Stream<CurrencyState> _mapFetchCurrencyToState(FetchCurrency event) async* {
    yield CurrencyLoading();
    try {
      final currencyLoaded = await currencyProvider.getLatest();

      //
      yield CurrencyLoaded(currency: currencyLoaded);
    } catch (_) {
      yield CurrencyError();
    }
  }
}
