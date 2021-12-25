import 'package:dio/dio.dart';
import 'package:my_note_book/data/services/add_notes/model/add_notes_request_model.dart';
import 'package:my_note_book/data/services/add_notes/model/add_notes_response_model.dart';
import 'package:my_note_book/data/services/dio_manager.dart';
import 'package:http/http.dart' as http;

abstract class AddNotesService {
  Future addNotes(AddNotesRequestModel addNotesRequestModel);
}

class AddNotesServiceImp extends AddNotesService {
  final Dio _dio;

  AddNotesServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future addNotes(AddNotesRequestModel addNotesRequestModel) async {
    // return await _dio
    //     .post(
    //       "notebook/add_notes.php",
    //       data: addNotesRequestModel.toJson(),
    //     )
    //     .then((response) => addNotesResponseModelFromJson(response.data));

    const String _baseUrl = 'http://kadriyemacit.com/notebook/add_notes.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: addNotesRequestModel.toJson());

    if (response.statusCode == 200) {
      print('Not ekleme başarılı');
      return addNotesResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}
