import 'package:flutter/material.dart';

import '../../data/model/country_detail_model.dart';

class CountryDetailWidget extends StatelessWidget {
  final CountryDetailModel countryDetailModel;

  const CountryDetailWidget({required this.countryDetailModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.teal[700],
        image: const DecorationImage(
          image: AssetImage(
            'images/bike.jpg',
          ),
          fit: BoxFit.fitHeight,
          opacity: 0.85,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              color: Colors.black.withOpacity(0.3),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Common Name : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      countryDetailModel.name!.common!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Official Name : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      countryDetailModel.name!.official!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Population : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      countryDetailModel.population.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Region : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      countryDetailModel.region!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Subregion : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      countryDetailModel.subregion!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Capital : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Text(
                      countryDetailModel.capital!.join(', '),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              countryDetailModel.flags!.png.toString(),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}
