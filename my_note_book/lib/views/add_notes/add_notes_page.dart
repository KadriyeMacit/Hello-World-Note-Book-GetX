import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note_book/data/src/colors.dart';
import 'package:my_note_book/data/src/strings.dart';
import 'package:my_note_book/views/add_notes/add_notes_controller.dart';

class AddNotesPage extends GetWidget<AddNotesController> {
  const AddNotesPage({Key? key}) : super(key: key);

  static const String routeName = '/views/add_notes/add_notes_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(addNoteAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText(),
                _buildSpace(),
                _buildTextFieldTitle(),
                _buildSpace(),
                Divider(),
                _buildSpace(),
                _buildDescription(),
                _buildSpace(),
                _buildTextFieldDescription(),
              ],
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 20,
    );
  }

  Widget _buildTitleText() {
    return Text(
      addNoteTitleText,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextFieldTitle() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 40),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: addNoteTitleHintText,
          ),
          controller: controller.titleController,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      addNoteDescriptionText,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildTextFieldDescription() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 70),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: addNoteDescriptionHinText,
          ),
          controller: controller.descriptionController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
          onPressed: () {},
          child: Text(addNoteSaveButton),
          style: ElevatedButton.styleFrom(
            primary: mainColor,
          )),
    );
  }
}
