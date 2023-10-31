import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String ? Hint;
  final String ? Labol;
   final Widget?suffics;
    final bool obscure;
  final TextEditingController ControllerTitle;
  final FormFieldValidator<String>?Validator;
  const CustomTextField({super.key, this.Hint,
    required this.ControllerTitle, this.Validator, this.Labol, this.suffics,  this.obscure=false
  });




  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return TextFormField(
      obscureText:obscure ,
      controller: ControllerTitle ,
      validator: Validator ,
      decoration: InputDecoration(

        suffixIcon: suffics,
        hintText:Hint,
        labelText: Labol,
        labelStyle: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
      ),
    );
  }
}
