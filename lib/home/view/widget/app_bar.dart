import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget {
  final String appTitle;
  AppBarMenu({Key? key, title, required this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            appTitle,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600),
          )
        ],
      ),
      actions: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(
              Icons.share,
            ))
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
