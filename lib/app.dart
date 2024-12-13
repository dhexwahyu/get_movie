
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_movie/helper/messaging.dart';
import 'package:get_movie/interface/container/home_page/view.dart';
import 'package:get_movie/interface/container/login_page/view.dart';
import 'package:get_movie/interface/container/main/view.dart';



class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          primary: false,
          resizeToAvoidBottomInset: false,
          key: MessagingInstance.instance.key,
          body: currentApp(),
        ),
      ),
    );
  }

  Widget currentApp() {
    ColorScheme defaultColorScheme = ColorScheme.light();
    final textButtonTheme = TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.resolveWith(
                    (states) => const Color(0xFFFF7F32))));
    return GetMaterialApp(
      title: 'Name App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/main', page: () => MainPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
      ],
      navigatorKey: MessagingInstance.instance.navigatorKey,
      theme: ThemeData(
          colorScheme: ColorScheme(
            primary: Color(0xFF8174A0),
          //  primaryVariant: Color(0xFFE6252C),
            primaryContainer: Color(0xFF8174A0),
            secondary: Color(0xFF00C7B1),
           // secondaryVariant: Color(0xFF0047BB),
            secondaryContainer: Color(0xFF0047BB),
            surface: Color(0xFFFAFBFB),
            onError: defaultColorScheme.onError,
            error: defaultColorScheme.error,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            brightness: Brightness.light,
          ),
         // toggleableActiveColor: Colors.red[400],
          inputDecorationTheme: const InputDecorationTheme(
            border: UnderlineInputBorder(),
            focusColor: Colors.purple,
            labelStyle: TextStyle(color: Colors.purple),

          ),
          iconTheme: const IconThemeData(color: Colors.purple),
          textButtonTheme: textButtonTheme,
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black),
          appBarTheme: const AppBarTheme(
              color: Color(0xFFFFFFFF),
              centerTitle: false,
              toolbarTextStyle: TextStyle(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black),
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.black, size: 14),
              actionsIconTheme: IconThemeData(color: Colors.black, size: 14))),
      onGenerateRoute: (RouteSettings settings){
        return CupertinoPageRoute<Object>(builder: (BuildContext context) {
          return MainPage();
        });
      },

    );
  }

}