import 'package:http/http.dart' as http;
import 'package:my_note_book/data/services/home/model/home_response_model.dart';

abstract class HomeService {
  Future getNotesTitle();
  Future getNotesDescription();
  Future getNotesDate();
}

class HomeServiceImp extends HomeService {
  @override
  Future getNotesTitle() async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteListTitle = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListTitle.add(data[i].title);
      }
      return noteListTitle;
    } else {
      return '';
    }
  }

  @override
  Future getNotesDescription() async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteListDescription = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListDescription.add(data[i].description);
      }
      return noteListDescription;
    } else {
      return '';
    }
  }

  @override
  Future getNotesDate() async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/get_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.get(_url);

    var noteListDate = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListDate.add(data[i].date);
      }
      return noteListDate;
    } else {
      return '';
    }
  }
}
