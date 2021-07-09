import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_list/model.dart';
import 'aboutpage.dart';
import 'infopage.dart';
import 'item_page.dart';
import 'main_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToBuyList(),
      child: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //toglie il banner "demo"
      title: 'Ultimate List',
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/about': (context) => AboutPage(),
        '/info': (context) => InfoPage()
      },
      onGenerateRoute: (route) {
        final uri = Uri.parse(route.name);
        debugPrint('Sto aprendo: ${uri.path}');
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'item') {
          final id = int.tryParse(uri.pathSegments[1]);
          if (id != null) {
            return MaterialPageRoute(builder: (context) {
              final item = context.watch<ToBuyList>().tobuy[id];
              return ChangeNotifierProvider.value(
                value: item,
                child: ItemPage(),
              );
            });
          }
        }
      },
    );
  }
}
