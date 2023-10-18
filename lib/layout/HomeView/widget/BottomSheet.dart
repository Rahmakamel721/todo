import 'package:flutter/material.dart';

import '../../../core/CustomerTextField.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleContoner = TextEditingController();
    var formkey = GlobalKey<FormState>();
    var theme = Theme.of(context);
    return Container(
      decoration:
      BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: formkey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Add new Task',
                  style: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.black),
                  textAlign: TextAlign.center,),
                CustomTextField(Hint: 'enter your task',
                    ControllerTitle: titleContoner,
                    Validator: (String?value) {
                      if (value == null || value.trim() == null) {
                        return 'you must enter ';
                      } else if (value.length < 10) {
                        return ' you must title at let 10 ';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'enter the description'
                  ),
                ),
                Text('Add new Task', style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.black),),
                GestureDetector(
                    onTap: () {
                      ShowClander(context);
                    },
                    child: Text('18 oct 2023',
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColor),
                      textAlign: TextAlign.center,)),
                ElevatedButton(onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print(titleContoner.text);
                  }
                },
                    child: Text('add Task',
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: Colors.white),))

              ]),
        ),
      ),

    );
  }

void ShowClander( BuildContext context) {
  showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime.now(), lastDate: DateTime.now().add(Duration( days: 356)));

}}