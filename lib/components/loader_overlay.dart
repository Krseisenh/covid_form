import 'package:covid_form/bloc/application_cubit.dart';
import 'package:covid_form/bloc/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoaderOverlay extends StatelessWidget {
  final Widget child;

  const LoaderOverlay({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationState>(
      buildWhen: (prev, current) => prev.toggleLoading != current.toggleLoading,
      builder: (BuildContext context, state) {
        return Stack(
          children: <Widget>[
            child,
            Visibility(
              visible: state.toggleLoading,
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(0.5),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
