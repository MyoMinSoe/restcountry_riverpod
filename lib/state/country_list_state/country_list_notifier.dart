import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/country_list_model.dart';
import '../../data/service/country_service.dart';
import 'country_list_state.dart';

part 'country_list_notifier.g.dart';

@riverpod
class CountryListNotifier extends _$CountryListNotifier {
  final CountryService _countryListService = CountryService();

  @override
  CountryListState build() {
    return CountryListStateLoading();
  }

  void getCountryList() async {
    try {
      state = CountryListStateLoading();
      final List<CountryListModel> countryListModelList =
          await _countryListService.getCountryList();
      state = CountryListStateSuccess(countryListModelList);
    } on DioException catch (e) {
      if (e is DioExceptionType) {
        final error = dioErrorHandling(e);
        state = CountryListStateFailed(error);
      } else {
        state = CountryListStateFailed(e.toString());
      }
    }
  }
}
