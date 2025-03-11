import 'package:flutter/material.dart';
import 'package:flutterapp/screens/guest/authscreen.dart';
import 'package:flutterapp/screens/guest/passwd.dart';
import 'package:flutterapp/screens/guest/terms.dart';

class Guest extends StatefulWidget {
  const Guest({super.key});

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    super.initState();
    _widgets.addAll([
      AuthScreen(
        onChangedStep: (int index) {
          setState(() {
            _indexSelected = index;
          });
        },
      ),
      Terms(onChangedStep: (int index) {
        setState(() {
          _indexSelected = index;
        });
      }),
      PasswdScreen(onchangedStep: (int index) {
        setState(() {
          _indexSelected = index;
        });
      }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
