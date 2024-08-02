import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/country_detail_model.dart';
import '../../state/country_detail_state/country_detail_notifier.dart';
import '../../state/country_detail_state/country_detail_state.dart';
import '../widget/country_detail_widget.dart';
import '../widget/failed_widget.dart';

class CountryDetail extends ConsumerStatefulWidget {
  final String countryName;

  const CountryDetail({required this.countryName, super.key});

  @override
  ConsumerState<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends ConsumerState<CountryDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref
          .read(countryDetailNotifierProvider.notifier)
          .getCountry(widget.countryName.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    final CountryDetailState countryDetailState =
        ref.watch(countryDetailNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: switch (countryDetailState) {
        //Loading
        CountryDetailStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        //Success
        CountryDetailStateSuccess(
          countryDetailModel: CountryDetailModel countryDetail
        ) =>
          CountryDetailWidget(countryDetailModel: countryDetail),
        //Failed
        CountryDetailStateFailed(errorMsg: String errormsg) => FailedWidget(
            errorMsg: errormsg,
            tryAgain: () {},
          ),
      },
    );
  }
}
