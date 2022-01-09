import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/views/form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CovidForm());
}

class CovidForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationCubit>(
          create: (BuildContext context) => ApplicationCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Covid Form',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FormPage(),
      ),
    );
  }
}
