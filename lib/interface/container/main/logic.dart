import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movie/interface/container/home_page/view.dart';
import 'package:get_movie/model/auth.dart';
import 'package:get_movie/model/menu.dart';
import 'package:get_movie/storage/storage.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }


  void init() async {
    List<Menu>? menu = [
      Menu(
          key: "home",
          label: "Home",
          icon: Icons.home,
          backgroundColor: Colors.red,
          page: HomePage()
      ),
      Menu(
          key: "scan",
          label: "Scanner",
          icon: Icons.camera,
          backgroundColor: Colors.red,
          page: HomePage()
      ),
      Menu(
          key: "account",
          label: "Akun",
          icon: Icons.account_circle,
          backgroundColor: Colors.red,
          page:  HomePage()
      ),
    ];

    setMenu(menu);
  }

  void setMenu(List<Menu> menu) async {
    state.menus = menu;
  }

  void checkUser(BuildContext context, Menu menu, int index) async {
    final storageAuth = await getStorage<Auth>();
    if(storageAuth.data?.accessToken == null){
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      menu.onTap != null
          ? menu.onTap!(context)
          : state.controller
          ?.jumpToPage(index);
    }
  }
}
