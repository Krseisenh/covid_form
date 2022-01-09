class ApplicationState {
  // model
  final String? firstname;
  final String? lastname; // null-able
  final String? nickname; // null-able
  final String? cid; // null- able
  final int? age; // null-able
  final String? gender;
  final List<String> selectedOptions;
  final bool toggleLoading;

  const ApplicationState({
    this.firstname,
    this.lastname,
    this.nickname,
    this.cid,
    this.age,
    this.gender,
    this.selectedOptions = const [],
    this.toggleLoading = false,
  });

  ApplicationState copyWith({
    String? firstname,
    String? lastname, // null-able
    String? nickname, // null-able
    String? cid, // null- able
    int? age, // null-able
    String? gender,
    List<String>? selectedOptions,
    bool? toggleLoading,
  }) {
    return ApplicationState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      nickname: nickname ?? this.nickname,
      cid: cid ?? this.cid,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      toggleLoading: toggleLoading ?? this.toggleLoading,
    );
  }
}
