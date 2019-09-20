import 'package:flutter/material.dart';

class ConnectionManager extends StatelessWidget {
  Future future;
  Function widget;

  ConnectionManager({
    @required this.future,
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            if (snapshot.hasError)
              return new Text(snapshot.error);
            else
              return widget(context, snapshot);
        }
      },
    );
  }
}
