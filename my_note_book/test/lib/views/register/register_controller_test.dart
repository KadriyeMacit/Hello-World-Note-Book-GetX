import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_note_book/data/services/register/model/register_response_model.dart';
import 'package:my_note_book/data/services/register/register_service.dart';
import 'package:my_note_book/views/register/register_controller.dart';

import '../../../test_observer.dart';

class MockRegisterService extends Mock implements RegisterService {}

class FakeRegisterResponseModel extends Fake implements RegisterResponseModel {}

void main() {
  late RegisterController _controller;
  late RegisterService _registerService;

  setUp(() {
    _registerService = MockRegisterService();
    _controller = RegisterController(_registerService);
  });

  test('isLoading changes', () {
    final TestObserver<bool> loadingObserver =
        _controller.isLoading.testObserver;
    const String username = 'kadriye';
    const String email = 'k@gmail.com';
    const String book = 'Alacakaranlık';
    const String password = '123456';

    when(() =>
            _controller.callingRegisterService(username, email, book, password))
        .thenAnswer((invocation) {
      expect(loadingObserver.history, containsAllInOrder([true, false]));
    });
  });

  test('isRegister should be true', () {
    const String username = 'kadriye';
    const String email = 'k@gmail.com';
    const String book = 'Alacakaranlık';
    const String password = '123456';

    when(() =>
            _controller.callingRegisterService(username, email, book, password))
        .thenAnswer((invocation) {
      expect(_controller.isRegister.value, true);
    });
  });

  test('callingRegisterService', () {
    const String username = 'kadriye';
    const String email = 'k@gmail.com';
    const String book = 'Alacakaranlık';
    const String password = '123456';

    when(() =>
            _controller.callingRegisterService(username, email, book, password))
        .thenAnswer((invocation) {
      expect(_controller.user.value, isInstanceOf<RegisterResponseModel>());
    });
  });
}
