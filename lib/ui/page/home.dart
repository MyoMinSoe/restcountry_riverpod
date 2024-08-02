import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/country_list_model.dart';
import '../../state/country_list_state/country_list_notifier.dart';
import '../../state/country_list_state/country_list_state.dart';
import '../widget/country_list_view.dart';
import '../widget/failed_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  CountryListNotifier? countryListNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      countryListNotifier?.getCountryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    countryListNotifier = ref.read(countryListNotifierProvider.notifier);
    final countryListState = ref.watch(countryListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: switch (countryListState) {
        //Loading
        CountryListStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        //Success
        CountryListStateSuccess(
          countryList: List<CountryListModel> countrylist
        ) =>
          CountryListView(
            countryList: countrylist,
          ),
        //Failed
        CountryListStateFailed(errorMessage: String errormsg) => FailedWidget(
            errorMsg: errormsg,
            tryAgain: () {
              countryListNotifier?.getCountryList();
            },
          ),
      },
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.replay_rounded,
          size: 50,
        ),
        onPressed: () {
          countryListNotifier!.getCountryList();
        },
      ),
    );
  }
}
