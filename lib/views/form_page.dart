import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/components/gender_selctor_section.dart';
import 'package:covid_form/components/personal_info_section.dart';
import 'package:covid_form/components/symtom_selection_section.dart';
import 'package:covid_form/views/report_page.dart';
import 'package:covid_form/views/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPage extends StatelessWidget {
  // immutable
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ApplicationCubit appCubit =
        BlocProvider.of<ApplicationCubit>(context, listen: false);
    return ScaffoldLayout(
      key: Key("form-page-tag"),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            PersonalInfoSection(),
            GenderSelectionSection(),
            SymtomSelectionSection(),
          ],
        ),
      ),
      bottom: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key("save-form"),
        child: Icon(Icons.save),
        onPressed: () async {
          await appCubit.submit().then((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportPage(),
              ),
            );
          });
        },
      ),
      location: FloatingActionButtonLocation.centerDocked,
    );
  }
}
