import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movie/model/menu.dart';
import 'package:get_movie/model/user.dart';


class MainState {
  List<Menu>? menus;
  PageController? controller;
  int? index;
  User? user;

  MainState({dynamic args}) {
    dynamic argumentData = Get.arguments;
    menus =  menus;
    controller = PageController(initialPage: 0);
    index = index;
  }
}
