import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_note_book/data/services/add_notes/add_notes_service.dart';
import 'package:my_note_book/data/services/add_notes/model/add_notes_response_model.dart';
import 'package:my_note_book/views/add_notes/add_notes_controller.dart';

import '../../../test_observer.dart';

class MockAddNotesService extends Mock implements AddNotesService {}

class FakeAddNotesResponseModel extends Fake implements AddNotesResponseModel {}

void main() {
  late AddNotesController _controller;
  late AddNotesService _addNotesService;

  setUp(() {
    _addNotesService = MockAddNotesService();
    _controller = AddNotesController(_addNotesService);
  });

  test('isLoading changes', () {
    final TestObserver<bool> loadingObserver = _controller.isLoading.testObserver;
    const String title = 'Alışveriş yap';
    const String description = 'Kitap, defter, kalem';

    when(() => _controller.callingAddNotesService(title, description)).thenAnswer((invocation) {
      expect(loadingObserver.history, containsAllInOrder([true, false]));
    });
  });

  test('isSave should be true', () {
    const String title = 'Alışveriş yap';
    const String description = 'Kitap, defter, kalem';

    when(() => _controller.callingAddNotesService(title, description)).thenAnswer((invocation) {
      expect(_controller.isSave.value, true);
    });
  });

  test('callingAddNotesService', () {
    const String title = 'Alışveriş yap';
    const String description = 'Kitap, defter, kalem';

    when(() => _controller.callingAddNotesService(title, description)).thenAnswer((invocation) {
      expect(_controller.note.value, isInstanceOf<AddNotesResponseModel>());
    });
  });
}
