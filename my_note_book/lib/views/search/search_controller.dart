import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:my_note_book/data/services/search/model/search_request_model.dart';
import 'package:my_note_book/data/services/search/search_service.dart';

class SearchController extends GetxController {
  final SearchService noteSearchService;

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

  final Debouncer _searchDebouncer = Debouncer(delay: _delayDuration);

  SearchController(
    this.noteSearchService,
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
    SearchRequestModel searchRequestModel = SearchRequestModel(title: typedNames);

    if (isLoading.value && isFromTappedNames) {
      debugPrint('Already getting names');
    } else {
      isLoading.call(true);
      noteSearchService //
          .search(searchRequestModel)
          .then((noteSearchResponseModel) {
        noteNameList.value = noteSearchResponseModel;
      }).catchError((dynamic error) {
        this.error.trigger(error);
        isNoResultFound.call(true);
      }).whenComplete(() {
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

    _loadNames(parsedSearchedString);

    // Get.back();
  }

  void onNamesChanged(String noteName) {
    isnoteNameNotEmpty.call(!noteName.isBlank!);
  }
}

const int _defaultNoIndex = -1;
const _delayDuration = Duration(milliseconds: 400);
