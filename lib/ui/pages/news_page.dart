import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/logic/bloc/news/news_bloc.dart';
import 'package:whatsupworld/repository/api_news.dart';
import 'package:whatsupworld/repository/news_provider.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/loading_widget.dart';
import 'package:whatsupworld/ui/widgets/news_widget.dart';
import 'package:whatsupworld/utils/translations.dart';


class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {

  final ApiNews _newsApi = new ApiNews();
  NewsProvider _newsProvider;
  NewsBloc _newsBloc;

  

  @override
  void didChangeDependencies() {
    
    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await Future.delayed(Duration(milliseconds: 200));
       _newsBloc.add(FetchNews());
    }); 
    super.didChangeDependencies();

  }

  @override
  void initState() {
    _newsProvider = new NewsProvider(apiNews: _newsApi);
    _newsBloc = new NewsBloc(newsProvider: _newsProvider);
    super.initState();
  }

  Widget _scaffold(BuildContext context) {
   
    return CommonScaffold(
        appTitle: allTranslations.text("news"),
        bodyData: bodyData(context),
        showFAB: true,
        showDrawer: false,
        floatingIcon: Icons.refresh,
        floatingCallback: () {
           _newsBloc.add(FetchNews());
        },       
        actionFirstIcon: null,
        actionFirstIconCallback: null,
      );
  }

  Widget bodyData(BuildContext context) {
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;    

    return SingleChildScrollView(child: 
      BlocBuilder(
        bloc : _newsBloc,
        builder: (_, NewsState state) {
      
      if (state is NewsLoaded) {
        return Container(
          height: hp(150),
          width: wp(150),
          child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              itemBuilder: (context, index) {
                return NewsWidget(
                  articleItem: state.news.articles[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: hp(1));
              },
              itemCount: state.news.articles.length),
        );
      }
      if (state is NewsLoading) {
        return LoadingWidget();
      }
      if (state is NewsError) {
        return Text(
          allTranslations.text("error_to_load"),
          style: TextStyle(color: Colors.red),
        );
      }

      if (state is NewsEmpty) {
        return Center(
          child : Text(allTranslations.text("empty_result_reload"),
          style: TextStyle(
                      fontSize: 20,
                      color: Palette.appColorBlue,
                    ),
        ));
      }

      return Center(
          child: Text(
          '...',
          style: TextStyle(
                      fontSize: 20,
                      color: Palette.appColorBlue,
                    ),
        ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
     return _scaffold(context);
  }

  @override
  bool get wantKeepAlive => true;
}
