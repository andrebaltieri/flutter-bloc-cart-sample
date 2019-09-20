import 'package:cart/pages/products.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/cart.bloc.dart';
import 'pages/tabs.page.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: TabsPage(),
      ),
    );
  }
}
