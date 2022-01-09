import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/bloc/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionSection extends StatelessWidget {
  const GenderSelectionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationCubit appCubit = BlocProvider.of<ApplicationCubit>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('เพศ'),
            ],
          ),
          BlocSelector<ApplicationCubit, ApplicationState, String?>(
            selector: (state) => state.gender,
            builder: (_, gender) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ชาย'),
                Radio(
                  key: Key('male-tag'),
                  value: 'Male',
                  groupValue: appCubit.state.gender,
                  onChanged: (String? value) => appCubit.onRadioButtonChange(value),
                ),
                Text('หญิง'),
                Radio(
                  key: Key('female-tag'),
                  value: 'Female',
                  groupValue: appCubit.state.gender,
                  onChanged: (String? value) => appCubit.onRadioButtonChange(value),
                ),
                Text('อื่นๆ'),
                Radio(
                  key: Key('other-tag'),
                  value: 'Other',
                  groupValue: appCubit.state.gender,
                  onChanged: (String? value) => appCubit.onRadioButtonChange(value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
