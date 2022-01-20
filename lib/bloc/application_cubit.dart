import 'package:covid_form/bloc/application_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState());
  // controller

  void onRadioButtonChange(String? selectedGender) {
    emit(state.copyWith(gender: selectedGender));
  }

  void setFirstname(String? firstname) {
    emit(state.copyWith(firstname: firstname));
  }

  void setLastname(String? lastname) {
    emit(state.copyWith(lastname: lastname));
  }

  void setNickname(String? nickname) {
    emit(state.copyWith(nickname: nickname));
  }

  void setCID(String? cid) {
    emit(state.copyWith(cid: cid));
  }

  void setAge(String? age) {
    emit(state.copyWith(age: int.parse(age!)));
  }

  Future<R> loadingEffect<R>(Future<R> Function() effect) async {
    try {
      emit(state.copyWith(toggleLoading: true));
      return await effect();
    } finally {
      emit(state.copyWith(toggleLoading: false));
    }
  }

  Future submit() async {
    emit(state.copyWith(toggleLoading: true));
    await Future.delayed(Duration(seconds: 1)).then((value) {
      emit(state.copyWith(toggleLoading: false));
    });
  }
}
