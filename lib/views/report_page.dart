import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/bloc/application_state.dart';
import 'package:covid_form/views/scaffold_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final applicationCubit = BlocProvider.of<ApplicationCubit>(context);
    return ScaffoldLayout(
      key: Key("report-page-tag"),
      title: 'รายงาน',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: Image.asset(
                  'assets/logo_v1.png',
                  key: Key('covid-image-tag'),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: BlocBuilder<ApplicationCubit, ApplicationState>(
                  builder: (context, appState) => Column(
                    children: [
                      Text(
                        'คุณ ${appState.firstname} ${appState.lastname} (${appState.nickname})',
                        key: Key('report-fullname-tag'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'อายุ ${appState.age}',
                        key: Key('report-age-tag'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        appState.selectedOptions.length >= 3 ? 'คุณเป็นโควิท' : 'คุณไม่เป็นโควิท',
                        key: Key('covid-confirm-tag'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('confirm-button-tag'),
        onPressed: () => Navigator.pop(context),
        child: Text('ยืนยัน'),
      ),
    );
  }
}
