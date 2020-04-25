part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();
}

class CurrencyInitial extends CurrencyState {
  @override
  List<Object> get props => [];
}


class CurrencyEmpty extends CurrencyState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CurrencyLoading extends CurrencyState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CurrencyLoaded extends CurrencyState {
  final Currency currency;

  CurrencyLoaded({@required this.currency});

  @override
  List<Object> get props => [currency];
}

class CurrencyError extends CurrencyState {
  @override
  List<Object> get props => throw UnimplementedError();
}