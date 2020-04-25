part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class FetchCurrency extends CurrencyEvent {
  @override
  List<Object> get props => [];
}

class RefreshNews extends CurrencyEvent {
  @override
  List<Object> get props => [];
}