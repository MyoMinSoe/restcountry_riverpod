import '../../data/model/country_list_model.dart';

sealed class CountryListState {}

class CountryListStateLoading extends CountryListState {}

class CountryListStateSuccess extends CountryListState {
  final List<CountryListModel> countryList;

  CountryListStateSuccess(this.countryList);
}

class CountryListStateFailed extends CountryListState {
  final String errorMessage;

  CountryListStateFailed(this.errorMessage);
}
