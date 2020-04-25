import 'package:flutter/material.dart';
import 'package:whatsupworld/dashboard/index.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _dashboardBloc = DashboardBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: DashboardScreen(dashboardBloc: _dashboardBloc),
    );
  }
}
