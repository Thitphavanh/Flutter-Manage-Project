import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login/login_page.dart';
import 'package:flutter_project_manage/src/config/route.dart' as custom_route;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: custom_route.Route.getAll(),
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final token = snapshot.data!.getString('Setting.token_pref') ?? '';
            if (token.isNotEmpty) {
              return HomePage();
            }
            return const LoginPage();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
