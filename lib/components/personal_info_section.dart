import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoSection extends StatelessWidget {
  PersonalInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationCubit appCubit =
        BlocProvider.of<ApplicationCubit>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          InputField(
            key: Key("firstname-tag"),
            value: appCubit.state.firstname,
            labelText: 'ชื่อ',
            onChanged: (String? value) => appCubit.setFirstname(value),
          ),
          InputField(
            key: Key("lastname-tag"),
            value: appCubit.state.lastname,
            labelText: 'นามสกุล',
            onChanged: (String? value) => appCubit.setLastname(value),
          ),
          InputField(
            key: Key("nickname-tag"),
            value: appCubit.state.nickname,
            labelText: 'ชื่อเล่น',
            onChanged: (String? value) => appCubit.setNickname(value),
          ),
          InputField(
            key: Key("citizenID-tag"),
            value: appCubit.state.cid,
            labelText: 'รหัสบัตรประชาชน',
            inputType: TextInputType.number,
            onChanged: (String? value) => appCubit.setCID(value),
          ),
          InputField(
            key: Key("age-tag"),
            value: appCubit.state.age?.toString(),
            labelText: 'อายุ',
            inputType: TextInputType.number,
            onChanged: (String? value) => appCubit.setAge(value),
          ),
        ],
      ),
    );
  }
}
