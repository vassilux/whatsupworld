import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/logic/bloc/currency/currency_bloc.dart';
import 'package:whatsupworld/repository/api_currency.dart';
import 'package:whatsupworld/repository/currency_provider.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/currency_widget.dart';
import 'package:whatsupworld/ui/widgets/loading_widget.dart';
import 'package:whatsupworld/utils/translations.dart';
import 'package:whatsupworld/utils/uidata.dart';

class CurrencyExchangePage extends StatefulWidget {
  CurrencyExchangePage({Key key}) : super(key: key);

  @override
  _CurrencyExchangePageState createState() => _CurrencyExchangePageState();
}

class _CurrencyExchangePageState extends State<CurrencyExchangePage>
    with AutomaticKeepAliveClientMixin {
  final ApiCurrency _currencyApi = new ApiCurrency();
  CurrencyProvider _currencyProvider;
  CurrencyBloc _currencyBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await Future.delayed(Duration(milliseconds: 200));
      _currencyBloc.add(FetchCurrency());
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _currencyProvider = new CurrencyProvider(apiCurrency: _currencyApi);
    _currencyBloc = new CurrencyBloc(_currencyProvider);
    super.initState();
  }

  Widget _scaffold(BuildContext context) {
    
    return CommonScaffold(
      appTitle: allTranslations.text("currency"),
      bodyData: bodyData(context),
      showFAB: false,
      showDrawer: false,
      floatingIcon: Icons.refresh,
      floatingCallback: null,
      actionFirstIcon: null,
      actionFirstIconCallback: null,
    );
  }

  Widget bodyData(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp; 

    return SingleChildScrollView(
        child: BlocBuilder(
            bloc: _currencyBloc,
            builder: (_, CurrencyState state) {
              if (state is CurrencyLoading) {
                return LoadingWidget();
              }

              if (state is CurrencyLoaded) {
                var currency = state.currency;
                DateTime dt = DateTime.parse(currency.date);

                return Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                    child: Text(
                        allTranslations.text("currency_eur_exchange") +
                            formatDate(dt, [dd, '/', mm, '/', yyyy]),
                        style: UIData.h2Style.copyWith(
                          color: Palette.appColorRed,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    height: hp(150),
                    width: wp(200),
                    child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                        itemBuilder: (context, index) {
                          return CurrencyRateWidget(
                              rate: currency.rates[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: hp(1));
                        },
                        itemCount: currency.rates.length),
                  )
                ]);
              }

              if (state is CurrencyError) {
                return Container(
                  child: Text(allTranslations.text("error_to_load"),style: UIData.h5Style.copyWith(
                        color: Palette.appColorRed,
                        fontWeight: FontWeight.bold,
                      )),
                );
              }

              if (state is CurrencyEmpty) {
                return Container(
                  padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                  child: Text(allTranslations.text("empty_result_reload"),
                      style: UIData.h5Style.copyWith(
                        color: Palette.appColorRed,
                        fontWeight: FontWeight.bold,
                      )),
                );
              }

              return Center(
                child: Text("... "),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _scaffold(context);
  }
}
