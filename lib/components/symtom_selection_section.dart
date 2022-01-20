import 'package:covid_form/components/covid_form_options_molecule.dart';
import 'package:flutter/material.dart';

class SymtomSelectionSection extends StatelessWidget {
  const SymtomSelectionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CovidFormOptionsMolecule(
      key: Key("symtom-header-tag"),
      title: 'อาการ',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
            key: Key('syntom-one-tag'),
            title: Text('ไอ'),
            value: false,
            onChanged: (val) {},
          ),
          CheckboxListTile(
            key: Key('syntom-two-tag'),
            title: Text('เจ็บคอ'),
            value: false,
            onChanged: (val) {},
          ),
          CheckboxListTile(
            key: Key('syntom-three-tag'),
            title: Text('ไข้'),
            value: false,
            onChanged: (val) {},
          ),
          CheckboxListTile(
            key: Key('syntom-four-tag'),
            title: Text('เสมหะ'),
            value: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}
