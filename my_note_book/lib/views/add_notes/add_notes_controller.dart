import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_note_book/data/services/add_notes/add_notes_service.dart';
import 'package:my_note_book/data/services/add_notes/model/add_notes_request_model.dart';
import 'package:my_note_book/data/services/add_notes/model/add_notes_response_model.dart';

class AddNotesController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isSave = RxBool(false);

  final Rxn<AddNotesResponseModel> note = Rxn();

  final AddNotesService _addNotesService;

  AddNotesController(this._addNotesService);

  void callingAddNotesService(String title, String description) {
    final AddNotesRequestModel addNotesRequestModel = AddNotesRequestModel(
      title: title,
      description: description,
      isRemove: '0',
    );

    isLoading.call(true);
    _addNotesService.addNotes(addNotesRequestModel).then(
      (note) {
        if (note.statu) isSave.call(true);
      },
    ).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(
      () {
        isLoading.call(false);
      },
    );
  }
}
