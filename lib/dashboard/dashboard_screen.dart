import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsupworld/dashboard/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key key,
    @required DashboardBloc dashboardBloc,
  })  : _dashboardBloc = dashboardBloc,
        super(key: key);

  final DashboardBloc _dashboardBloc;

  @override
  DashboardScreenState createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  DashboardScreenState();

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        bloc: widget._dashboardBloc,
        builder: (
          BuildContext context,
          DashboardState currentState,
        ) {
          if (currentState is UnDashboardState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorDashboardState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: () => this._load(),
                  ),
                ),
              ],
            ));
          }
           if (currentState is InDashboardState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                  Text('Flutter files: done'),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text('throw error'),
                      onPressed: () => this._load(true),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load([bool isError = false]) {
    widget._dashboardBloc.add(LoadDashboardEvent(isError));
  }
}
