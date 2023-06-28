import 'package:fitlog/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:fitlog/components/appbar.dart';
import 'package:fitlog/components/sidemenu.dart';
import 'package:fitlog/provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      drawer: SideMenu(),
      body: Column(
        children: [CalendarWidget()],
      ),
    );
  }
}
