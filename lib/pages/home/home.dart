import 'package:flutter/material.dart';
import 'package:order_in/helpers/responsive_helper.dart';
import 'package:order_in/pages/home/mobile_home.dart';
import 'package:order_in/pages/home/tablet_home.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    TextEditingController().clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: MobileHomePage(searchController: searchController),
      tablet: TabletHomePage(searchController: searchController),
    );
  }
}




