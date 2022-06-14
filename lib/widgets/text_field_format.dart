import 'package:customstuff/constant/text_style.dart';
import 'package:flutter/material.dart';

class TextFieldFormat extends StatelessWidget {
  final String textFieldName;
  final Widget textFormField;

  const TextFieldFormat(
      {Key? key, required this.textFieldName, required this.textFormField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(textFieldName, style: CustomTextStyle.kTextFormTitle),
        ),
        const SizedBox(height: 5.0),
        textFormField,
      ],
    );
  }
}
