import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar androidAppBar(int trips) {
  return AppBar(
    title: const Text(
      "Short Vacation",
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      Container(
        alignment: Alignment.center,
        child: Text(
          "$trips",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      const Icon(
        Icons.flight,
        color: Colors.white,
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}

PreferredSizeWidget iosAppBar(int trips) {
  return CupertinoNavigationBar(
    backgroundColor: const Color(0xFF3EBACE),
    middle: const Text(
      "Short Vacation",
      style: TextStyle(color: Colors.white),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "$trips",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Icon(
          Icons.flight,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(
          width: 3,
        )
      ],
    ),
  );
}
