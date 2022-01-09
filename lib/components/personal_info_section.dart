import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoSection extends StatelessWidget {
  PersonalInfoSection({Key? key}) : super(key: key);

  final TextEditingController _conFirst = TextEditingController();
  final TextEditingController _conLast = TextEditingController();
  final TextEditingController _conNick = TextEditingController();
  final TextEditingController _conCID = TextEditingController();
  final TextEditingController _conAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ApplicationCubit appCubit = BlocProvider.of<ApplicationCubit>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          InputField(
            key: Key("firstname-tag"),
            controller: _conFirst,
            labelText: 'ชื่อ',
            onChanged: (String? value) => appCubit.setFirstname(value),
          ),
          InputField(
            key: Key("lastname-tag"),
            controller: _conLast,
            labelText: 'นามสกุล',
            onChanged: (String? value) => appCubit.setLastname(value),
          ),
          InputField(
            key: Key("nickname-tag"),
            controller: _conNick,
            labelText: 'ชื่อเล่น',
            onChanged: (String? value) => appCubit.setNickname(value),
          ),
          InputField(
            key: Key("citizenID-tag"),
            controller: _conCID,
            labelText: 'รหัสบัตรประชาชน',
            inputType: TextInputType.number,
            onChanged: (String? value) => appCubit.setCID(value),
          ),
          InputField(
            key: Key("age-tag"),
            controller: _conAge,
            labelText: 'อายุ',
            inputType: TextInputType.number,
            onChanged: (String? value) => appCubit.setAge(value),
          ),
        ],
      ),
    );
  }
}
