import 'dart:convert';

AddNotesResponseModel addNotesResponseModelFromJson(String str) => AddNotesResponseModel.fromJson(
      json.decode(str),
    );

class AddNotesResponseModel {
  final bool statu;
  final String message;

  AddNotesResponseModel.fromJson(Map<String, dynamic> json)
      : statu = json["STATU"],
        message = json["MESSAGE"];
}
