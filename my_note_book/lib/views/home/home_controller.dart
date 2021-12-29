import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_note_book/data/services/home/home_service.dart';

class HomeController extends GetxController {
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();

  final Rxn<List> notesTitle = Rxn();
  final Rxn<List> notesDescription = Rxn();
  final Rxn<List> notesDate = Rxn();

  final HomeService _homeService;

  HomeController(this._homeService);

  @override
  void onInit() {
    _callingGetNotesTitle();
    _callingGetNotesDescription();
    _callingGetNotesDate();
    super.onInit();
  }

  void _callingGetNotesTitle() {
    isLoading.call(true);

    _homeService.getNotesTitle().then((not) {
      notesTitle.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetNotesDescription() {
    isLoading.call(true);

    _homeService.getNotesDescription().then((not) {
      notesDescription.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetNotesDate() {
    isLoading.call(true);

    _homeService.getNotesDate().then((not) {
      notesDate.value = not;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
