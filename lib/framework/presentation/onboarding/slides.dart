import 'package:flutter/material.dart';

Widget slideOne() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(image: AssetImage('assets/photos/ic_notepad.png')),
      SizedBox(height: 20),
      Text(
        'Organize your notes, and never lose them again!',
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      )
    ],
  );
}

Widget slideTwo() {
  return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image(image: AssetImage('assets/photos/ic_writing.png')),
    SizedBox(height: 24),
    Text(
      'Easy to use, and fun to write in!',
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    )
  ]);
}
