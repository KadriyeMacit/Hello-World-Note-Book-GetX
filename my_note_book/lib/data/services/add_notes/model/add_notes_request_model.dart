import 'dart:convert';

String addNoteRequestModelToJson(AddNotesRequestModel data) => json.encode(
      data.toJson(),
    );

class AddNotesRequestModel {
  final String title;
  final String description;
  final String isRemove;
  final String userId;

  AddNotesRequestModel({
    required this.title,
    required this.description,
    required this.isRemove,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "isRemove": isRemove,
        "userId": userId,
      };
}
