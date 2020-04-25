
import 'package:flutter/material.dart';
import 'package:whatsupworld/model/currency.dart';
import 'package:whatsupworld/repository/api_currency.dart';


class CurrencyProvider {  
  final ApiCurrency apiCurrency;

  CurrencyProvider({@required this.apiCurrency}): assert(apiCurrency != null);
 

  Future<Currency> getLatest() async {
    return apiCurrency.getLatest();
  }

}