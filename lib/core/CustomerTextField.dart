import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String Hint;
  final TextEditingController ControllerTitle;
  final FormFieldValidator<String>?Validator;
  const CustomTextField({super.key, required this.Hint,
    required this.ControllerTitle, this.Validator
  });



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ControllerTitle ,
      validator: Validator ,
      decoration: InputDecoration(
        hintText:Hint,

      ),
    );
  }
}
