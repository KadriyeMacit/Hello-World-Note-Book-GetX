import 'dart:convert';

List<dynamic> homeResponseModelFromJson(String str) =>
    List<dynamic>.from(json.decode(str)["notes"].map((x) => x).map((x) => HomeResponseModel.fromJson(x)));

class HomeResponseModel {
  HomeResponseModel({
    required this.noteId,
    required this.title,
    required this.description,
    required this.date,
    required this.isRemove,
  });

  final String noteId;
  final String title;
  final String description;
  final DateTime date;
  final String isRemove;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) => HomeResponseModel(
        noteId: json["noteId"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        isRemove: json["isRemove"],
      );
}
