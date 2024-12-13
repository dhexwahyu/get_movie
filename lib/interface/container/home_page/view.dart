import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movie/base_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'logic.dart';
import 'state.dart';

final listData = ["satu","dua", "tiga", "empat"];
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeLogic logic = Get.put(HomeLogic());
    final HomeState state = Get
        .find<HomeLogic>()
        .state;

    return GetBuilder<HomeLogic>(
        assignId: true,
        builder: (logic) {
        return BaseScreen(
          body:
          SafeArea(
              child: LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraint.maxHeight - 10,
                        ),
                        child: IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.all(24),
                            child: Form(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.menu_rounded)
                                        ],
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _title(context),
                                        _inputField(context),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                            backgroundColor: Colors.purple,
                                          ),
                                          child: const Text(
                                            "Scan Ticket",
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
      );
    });
  }
}

_title(context) {
  return const Column(
    children: [
      Text(
        "Scanner",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
      Text("Choose Category Event"),
    ],
  );
}

_inputField(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      DropdownSearch<String>(
        items: (filter, infiniteScrollProps) =>
        ["Menu", "Dialog", "Modal", "BottomSheet"],
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: "Mode",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.purple),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
          ),
        ),
        popupProps: PopupProps.menu(
            fit: FlexFit.loose, constraints: BoxConstraints()),
      ),
      const SizedBox(height: 15),
      DropdownSearch<String>(
        items: (filter, infiniteScrollProps) =>
        ["Menu", "Dialog", "Modal", "BottomSheet"],
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: 'Event',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.purple),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
          ),
        ),
        popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            constraints: BoxConstraints()),
      ),
      const SizedBox(height: 15),
      DropdownSearch<String>(
        items: (filter, infiniteScrollProps) =>
        ["Menu", "Dialog", "Modal", "BottomSheet"],
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: 'Gate',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.purple),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
          ),
        ),
        popupProps: PopupProps.menu(
            fit: FlexFit.loose, constraints: BoxConstraints()),
      ),
      const SizedBox(height: 15),
      DropdownSearch<String>(
        items: (filter, infiniteScrollProps) =>
        ["Menu", "Dialog", "Modal", "BottomSheet"],
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: 'Category',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.purple),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
            ),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
          ),
        ),
        popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            constraints: BoxConstraints()),
      ),
      const SizedBox(height: 40),
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                "Check In",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                "Check Out",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
