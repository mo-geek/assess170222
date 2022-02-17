import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String text;

  const NoDataFound(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 200),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.714285714),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      style: TextStyle(
                        fontSize: ui.window.devicePixelRatio <= 2 &&
                                (ui.window.physicalSize.width >= 1920 ||
                                    ui.window.physicalSize.height >= 1920)
                            ? 22
                            : 17,
                        color: Colors.red,
                      )),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
