import 'dart:convert';

List<dynamic> searchResponseModelFromJson(String str) =>
    List<dynamic>.from(json.decode(str)["notes"].map((x) => x).map((x) => HomeResponseModel.fromJson(x)));

class HomeResponseModel {
  HomeResponseModel({
    required this.noteId,
    required this.title,
    required this.description,
  });

  final String noteId;
  final String title;
  final String description;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) => HomeResponseModel(
        noteId: json["noteId"],
        title: json["title"],
        description: json["description"],
      );
}
