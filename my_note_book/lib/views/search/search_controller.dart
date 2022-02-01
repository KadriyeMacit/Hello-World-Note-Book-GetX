import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:my_note_book/data/services/home/home_service.dart';

class SearchController extends GetxController {
  final HomeService noteSearchRepository;

  final TextEditingController namesTextController = TextEditingController();

  final RxList<dynamic> noteNameList = RxList([]);
  final RxBool isLoading = RxBool(false);
  final RxBool isnoteNameNotEmpty = RxBool(false);

  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isNoResultFound = RxBool(false);
  final Rxn triggerHideKeyboard = Rxn();
  String lastSearchNames = '';
  final RxInt selectedIndex = _defaultNoIndex.obs;
  String parsedSearchedString = '';

  final RxList<dynamic> noteFundList = RxList([]);
  final RxList<dynamic> noteStockList = RxList([]);

  final Debouncer _searchDebouncer = Debouncer(delay: _delayDuration);

  SearchController(
    this.noteSearchRepository,
  );

  void search(String noteName) {
    _searchDebouncer(() {
      if (!noteName.isBlank! && noteName != lastSearchNames) {
        parsedSearchedString = Uri.encodeFull(noteName);
        _loadNames(parsedSearchedString, isFromTappedNames: false);
      }
    });
  }

  void _loadNames(String typedNames, {String container = '', bool isFromTappedNames = true}) {
    if (isLoading.value && isFromTappedNames) {
      debugPrint('Already getting names');
    } else {
      isLoading.call(true);
      noteSearchRepository //
          .getNotesTitle()
          .then((instrumentSearchResponseModel) {
            noteNameList.value = instrumentSearchResponseModel;
          })
          .catchError((dynamic error) => this.error.trigger(error))
          .whenComplete(() {
            if (noteNameList.isNotEmpty) {
              lastSearchNames = Uri.decodeFull(typedNames);
              isNoResultFound.call(false);
            } else {
              isNoResultFound.call(true);
            }

            selectedIndex.call(_defaultNoIndex);
            isLoading.call(false);
            if (container.isNotEmpty) {
              triggerHideKeyboard.trigger(null);
            }
          });
    }
  }

  void onNamesSelected(int id) {
    selectedIndex.call(id);

    final String parsedId = Uri.encodeFull(
      noteNameList[id].title.toString(),
    );

    _loadNames(parsedSearchedString, container: parsedId);

    // Get.back();
  }

  void onNamesChanged(String noteName) {
    isnoteNameNotEmpty.call(!noteName.isBlank!);
  }
}

const int _defaultNoIndex = -1;
const _delayDuration = Duration(milliseconds: 400);
