import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? inputType;
  final void Function(String?)? onChanged;

  const InputField({
    Key? key,
    this.labelText,
    required this.controller,
    this.inputType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: TextFormField(
        key: key ?? Key("input-field-tag"),
        decoration: InputDecoration(
          labelText: labelText ?? 'label',
        ),
        controller: controller,
        keyboardType: inputType ?? TextInputType.name,
        validator: (String? value) {
          String? message;
          if (value == null || value.isEmpty) {
            message = 'ต้องการข้อมูล';
          }
          return message;
        },
        onChanged: onChanged,

        // (String? value) => setState(() {
        //   firstname = value;
        // }),
      ),
    );
  }
}