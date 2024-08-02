import 'package:dio/dio.dart';
import '../../constant/api_service.dart';
import '../model/country_detail_model.dart';
import '../model/country_list_model.dart';

class CountryService {
  Dio dio = Dio();

  Future<List<CountryListModel>> getCountryList() async {
    Uri uri = Uri.parse(
        '${ApiService.baseUrl}${ApiService.all}?fields=name,flags,region');
    final response = await dio.getUri(uri);
    final result = (response.data as List)
        .map((data) => CountryListModel.fromJson(data))
        .toList();
    return result;
  }

  Future<CountryDetailModel> getCountry(String name) async {
    Uri uri = Uri.parse(
        '${ApiService.baseUrl}${ApiService.detail}/$name?fullText=true&fields=name,flags,capital,region,subregion,population');
    final response = await dio.getUri(uri);
    final result = (response.data as List)
        .map((data) => CountryDetailModel.fromJson(data));
    return result.first;
  }
}

String dioErrorHandling(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Network Connection Timeout';
    case DioExceptionType.badResponse:
      return 'Check url or parameters are valid!';
    case DioExceptionType.cancel:
      return 'Request Cancelled,Check url or parameter are invalid';
    case DioExceptionType.badCertificate:
      return 'Internal Server Error';
    case DioExceptionType.connectionError:
      return 'Connection Error';
    case DioExceptionType.unknown:
      return 'No Internet Connection';
    default:
      return 'Unknow Error';
  }
}
