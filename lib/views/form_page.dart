import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/components/gender_selctor_section.dart';
import 'package:covid_form/components/personal_info_section.dart';
import 'package:covid_form/views/report_page.dart';
import 'package:covid_form/views/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPage extends StatelessWidget {
  // immutable
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ApplicationCubit appCubit = BlocProvider.of<ApplicationCubit>(context, listen: false);
    return ScaffoldLayout(
      key: Key("form-page-tag"),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            PersonalInfoSection(),
            GenderSelectionSection(),
            // Container(
            //   margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text('อาการ'),
            //         ],
            //       ),
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           CheckboxListTile(
            //             key: Key('syntom-one-tag'),
            //             title: Text('ไอ'),
            //             value: _isOption1,
            //             onChanged: (_) {
            //               setState(() {
            //                 _isOption1 = !_isOption1;
            //                 if (_isOption1) {
            //                   selectedOptions.add('ไอ');
            //                 } else {
            //                   selectedOptions.remove('ไอ');
            //                 }
            //               });
            //             },
            //           ),
            //           CheckboxListTile(
            //             key: Key('syntom-two-tag'),
            //             title: Text('เจ็บคอ'),
            //             value: _isOption2,
            //             onChanged: (val) {
            //               setState(() {
            //                 _isOption2 = !_isOption2;
            //                 if (_isOption2) {
            //                   selectedOptions.add('เจ็บคอ');
            //                 } else {
            //                   selectedOptions.remove('เจ็บคอ');
            //                 }
            //               });
            //             },
            //           ),
            //           CheckboxListTile(
            //             key: Key('syntom-three-tag'),
            //             title: Text('ไข้'),
            //             value: _isOption3,
            //             onChanged: (val) {
            //               setState(() {
            //                 _isOption3 = !_isOption3;
            //                 if (_isOption3) {
            //                   selectedOptions.add('มีไข้');
            //                 } else {
            //                   selectedOptions.remove('มีไข้');
            //                 }
            //               });
            //             },
            //           ),
            //           CheckboxListTile(
            //             key: Key('syntom-four-tag'),
            //             title: Text('เสมหะ'),
            //             value: _isOption4,
            //             onChanged: (val) {
            //               setState(() {
            //                 _isOption4 = !_isOption4;
            //                 if (_isOption4) {
            //                   selectedOptions.add('เสมหะ');
            //                 } else {
            //                   selectedOptions.remove('เสมหะ');
            //                 }
            //               });
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
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
