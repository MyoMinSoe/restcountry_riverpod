import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/country_detail_model.dart';
import '../../data/service/country_service.dart';
import 'country_detail_state.dart';

part 'country_detail_notifier.g.dart';

@riverpod
class CountryDetailNotifier extends _$CountryDetailNotifier {
  final CountryService _countryService = CountryService();

  @override
  CountryDetailState build() => CountryDetailStateLoading();

  void getCountry(String countryName) async {
    try {
      state = CountryDetailStateLoading();
      final CountryDetailModel country =
          await _countryService.getCountry(countryName);
      state = CountryDetailStateSuccess(country);
    } on DioException catch (e) {
      if (e is DioExceptionType) {
        final error = dioErrorHandling(e);
        state = CountryDetailStateFailed(error);
      } else {
        state = CountryDetailStateFailed(e.toString());
      }
    }
  }
}
