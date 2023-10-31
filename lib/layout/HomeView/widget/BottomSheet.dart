import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/TaskModel.dart';
import 'package:todo/networkLayer/FireStor.dart';

import '../../../core/CustomerTextField.dart';

class BottomSheetView extends StatefulWidget {

   BottomSheetView({super.key});

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
   DateTime SlectedDate= DateTime.now() ;

  TextEditingController titleContoner = TextEditingController();

  TextEditingController desContoner = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

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
                CustomTextField(Hint: 'enter your task',
                    ControllerTitle: desContoner,
                    Validator: (String?value) {
                      if (value == null || value.trim() == null) {
                        return 'you must enter ';
                      } else if (value.length < 10) {
                        return ' you must title at let 10 ';
                      } else {
                        return null;
                      }
                    }),
                Text('Add new Task', style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.black),),
                GestureDetector(
                    onTap: () {
                      ShowClander(context);
                    },
                    child: Text( DateFormat.yMMMMd().format(SlectedDate),
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColor),
                      textAlign: TextAlign.center,)),
                ElevatedButton(onPressed:()  async {

                  if (formkey.currentState!.validate()) {
                    var model=TaskModel( Title: titleContoner.text, DataTime: DateTime.now(), Description: desContoner.text, IsDone: false);
                     await FireStorUtils.AddDataFromFirestore(model);
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

void ShowClander( BuildContext context) async {
    var dateSlected= await showDatePicker(
        context: context,
     initialDate: DateTime.now(),
     firstDate:DateTime.now(),
     lastDate: DateTime.now().add(Duration( days: 356))
    );
    if(dateSlected==null)return;
    SlectedDate=dateSlected;
    setState(() {

    });

}
}




















