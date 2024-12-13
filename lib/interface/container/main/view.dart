import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movie/base_screen.dart';
import 'package:get_movie/helper/persist_page.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  final logic = Get.put(MainLogic());
  final state = Get
      .find<MainLogic>()
      .state;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stream = StreamController<int>.broadcast();
    return (state.menus == null || state.menus?.length == 0)
        ? Container()
        : StreamBuilder(
        stream: stream.stream,
        initialData: state.index ?? 0,
        builder: (BuildContext context, AsyncSnapshot<int> data) {
          final currentPage = data.data!;
          return GetBuilder<MainLogic>(
            assignId: true,
            builder: (logic) {
              return BaseScreen(
                showAppBar: false,
                builder: (BuildContext context) {
                  return Container(
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child:
                            PageView(
                              pageSnapping: true,
                              controller: state.controller,
                              onPageChanged: (int index) => stream.add(index),
                              children: List<Widget>.from(state.menus!.map((menu) =>
                              menu.onTap != null
                                  ? Container(
                                color: Colors.transparent,
                              )
                                  : Container(
                                  color: Colors.transparent,
                                  key: PageStorageKey<String?>(menu.key),
                                  child: PersistPage(
                                      child: menu.page)))),
                            ),
                            // PageView(
                            //   pageSnapping: true,
                            //   controller: state.controller,
                            //   onPageChanged: (int index) => stream.add(index),
                            //   children: List<Widget>.from(
                            //       state.menus!.map((menu) =>
                            //       menu.onTap != null
                            //           ? Container(
                            //         color: Colors.transparent,
                            //       )
                            //           : Container(
                            //           color: Colors.transparent,
                            //           key: PageStorageKey<String?>(menu.key),
                            //           child: PersistPage(
                            //             child: menu.page,
                            //           )
                            //       ))),
                            // ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      offset: Offset.fromDirection(0, 3)),
                                ]),
                            child: Row(
                                children: List<Widget>.generate(
                                    state.menus!.length,
                                    ((index) {
                                      final menu = state.menus![index];
                                      return Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: InkWell(
                                                  onTap: () {
                                                    menu.onTap != null
                                                        ? menu.onTap!(context)
                                                        : state.controller
                                                        ?.jumpToPage(index);
                                                  },
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Center(
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize
                                                                  .min,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: <Widget>[
                                                                Container(
                                                                  margin: const EdgeInsets.only(bottom: 5),
                                                                  child: Icon(
                                                                      menu.icon,
                                                                      size: 16,
                                                                      color: (data.data ?? 0) == index
                                                                          ? Theme.of(context).colorScheme.primary
                                                                          : const Color(0xFF707070)),
                                                                ),
                                                                Text(
                                                                  menu.label!,
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    color: (data
                                                                        .data ??
                                                                        0) ==
                                                                        index
                                                                        ? Theme
                                                                        .of(
                                                                        context)
                                                                        .colorScheme
                                                                        .primary
                                                                        : Color(
                                                                        0xFF707070),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ))));
                                    })
                                )
                            ),
                          ),
                        ],
                      ));
                },
              );
            },
          );
        });
  }
}