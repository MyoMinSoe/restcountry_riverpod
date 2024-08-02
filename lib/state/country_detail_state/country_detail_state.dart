import '../../data/model/country_detail_model.dart';

sealed class CountryDetailState {}

class CountryDetailStateLoading extends CountryDetailState {}

class CountryDetailStateSuccess extends CountryDetailState {
  final CountryDetailModel countryDetailModel;

  CountryDetailStateSuccess(this.countryDetailModel);
}

class CountryDetailStateFailed extends CountryDetailState {
  final String errorMsg;

  CountryDetailStateFailed(this.errorMsg);
}
