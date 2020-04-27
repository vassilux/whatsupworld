import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:whatsupworld/config/palette.dart';
import 'package:whatsupworld/logic/bloc/webcams/webcams_bloc.dart';
import 'package:whatsupworld/repository/api_webcams.dart';
import 'package:whatsupworld/repository/webcams_provider.dart';
import 'package:whatsupworld/ui/widgets/common_scaffold.dart';
import 'package:whatsupworld/ui/widgets/loading_widget.dart';
import 'package:whatsupworld/utils/translations.dart';
import 'package:whatsupworld/ui/widgets/webcam_item_widget.dart';

class WebcamsPage extends StatefulWidget {
  static const String routeName = '/webcams';

  @override
  _WebcamsPageState createState() => _WebcamsPageState();
}

class _WebcamsPageState extends State<WebcamsPage>
    with AutomaticKeepAliveClientMixin {
  final WebCamsProvider _weatherProvider = new WebCamsProvider();

  String filter = "";

  WebcamsBloc _webcamsBloc;

  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Canada",
    "Italy",
    "USA",
    "Blackberry",    
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _webcamsBloc = WebcamsBloc(webcamsProvider: _weatherProvider);

    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await Future.delayed(Duration(milliseconds: 200));
      _webcamsBloc.add(FetchWebCams());
    });
  }

  Widget _scaffold(BuildContext context) {
    return CommonScaffold(
      appTitle: "WebCams",
      bodyData: bodyData(context),
      showFAB: false,
      showDrawer: false,
      floatingIcon: Icons.refresh,
      floatingCallback: () {
        _webcamsBloc.add(FetchWebCams());
      },
      actionFirstIcon: null,
      actionFirstIconCallback: () {
        //_showCityChangeDialog(context);
      },
    );
  }

  onItemChanged(String value) {
    setState(() {
      filter = value;
    });
  }

  Widget bodyData(BuildContext context) {   

    return Container(
        child: BlocBuilder(
            bloc: _webcamsBloc,
            builder: (_, WebcamsState state) {
              if (state is WebcamsLoaded) {
                return Column(                   
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: allTranslations.text('search_here'),
                          ),
                          onChanged: onItemChanged,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 25),
                            itemBuilder: (context, index) {
                              return filter == null || filter == ""
                                  ? WebCamItemWidget(
                                      webcam: state.webcams[index])
                                  : state.webcams[index].country.toLowerCase()
                                          .contains(filter.toLowerCase())
                                      ? WebCamItemWidget(
                                          webcam: state.webcams[index])
                                      : new Container();
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 5);
                            },
                            itemCount: state.webcams.length),
                      )
                    ]);
              }
              if (state is WebcamsLoading) {
                return LoadingWidget();
              }
              if (state is WebcamsError) {
                return Text(
                  allTranslations.text("error_to_load"),
                  style: TextStyle(color: Colors.red),
                );
              }

              if (state is WebcamsEmpty) {
                return Center(
                    child: Text(
                  allTranslations.text("empty_result_reload"),
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
}
