import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note_book/data/src/colors.dart';
import 'package:my_note_book/data/src/strings.dart';
import 'package:my_note_book/views/info/info_controller.dart';

class InfoPage extends GetWidget<InfoController> {
  const InfoPage({Key? key}) : super(key: key);

  static const String routeName = '/views/info/info_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(infoAppBarText),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Text('Hakkında sayfası'),
      ),
    );
  }
}
