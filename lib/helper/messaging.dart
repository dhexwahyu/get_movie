import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagingInstance {
  static final MessagingInstance instance = MessagingInstance();
  late BuildContext context;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // late FlutterLocalNotificationsPlugin plugin;

  MessagingInstance() {
   // plugin = FlutterLocalNotificationsPlugin();
  }

  setContext(BuildContext context) {
    this.context = context;
  }
}