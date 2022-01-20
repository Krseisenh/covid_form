import 'package:flutter/material.dart';

class CovidFormOptionsMolecule extends StatelessWidget {
  final String title;
  final Widget body;

  const CovidFormOptionsMolecule({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                key: key ?? Key("covid-form-options"),
              ),
            ],
          ),
          body,

          ///
        ],
      ),
    );
  }
}
