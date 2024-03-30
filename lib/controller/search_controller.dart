import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statuse_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/search_date.dart';
import '../data/models/items_view_model.dart';

abstract class SearchController extends GetxController {
//?
  getSearchItems();
  //?
  startSearch();
  //?
  endSearch(String value);
}

class SearchControllerImp extends SearchController {
//? for search
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  final SearchItemsData _searchData = SearchItemsData(crudImp: Get.find());
  bool isSearch = false;
  final TextEditingController searchController = TextEditingController();
  List<ItemsViewModel> searchIemsResult = [];
  @override
  getSearchItems() async {
    searchIemsResult.clear();
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await _searchData.searchData(search: searchController.text);
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        List respnseData = response['data'];
        searchIemsResult
            .addAll(respnseData.map((e) => ItemsViewModel.fromJson(e)));
      } else {
        //? item not found
        statuseRequest = StatuseRequest.failuer;
      }
    }
    update();
  }

  @override
  startSearch() async {
    if (searchController.text.isNotEmpty) {
      isSearch = true;
      await getSearchItems();
    }
    update();
  }

  @override
  endSearch(String value) {
    if (value.isEmpty) {
      statuseRequest = StatuseRequest.defualt;
      isSearch = false;
    }
    update();
  }
}
