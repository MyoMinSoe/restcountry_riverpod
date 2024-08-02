import 'package:flutter/material.dart';

import '../../data/model/country_list_model.dart';
import '../page/detail.dart';

class CountryListView extends StatelessWidget {
  final List<CountryListModel> countryList;

  const CountryListView({super.key, required this.countryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.teal,
        image: DecorationImage(
          image: AssetImage(
            'images/bike.jpg',
          ),
          fit: BoxFit.fitHeight,
          opacity: 0.9,
        ),
      ),
      child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: countryList.length,
          itemBuilder: (context, index) {
            final countryListIndex = countryList[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CountryDetail(
                        countryName: countryListIndex.name!.common!),
                  ),
                );
                // context.push('/name/${countryListIndex.name!.common}');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                color: Colors.black12.withOpacity(0.1),
                child: ListTile(
                  title: Text(
                    countryListIndex.name!.common.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    countryListIndex.region.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Image.network(
                    countryListIndex.flags!.png.toString(),
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
