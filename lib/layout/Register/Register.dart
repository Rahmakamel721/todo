import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/layout/Login/LoginView.dart';

import '../../core/CustomerTextField.dart';

class RegisterView extends StatefulWidget {
  static const routeName="Register ";
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  Widget build(BuildContext context) {
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    TextEditingController FullName = TextEditingController();
    TextEditingController ConfirmPassword = TextEditingController();

    bool isVasible = false;
    var theme = Theme.of(context);
    var FormKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.cover)

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(toolbarHeight: 150,
          backgroundColor: Colors.transparent,
          title: Text('Regiter', style: theme.textTheme.titleLarge),
          centerTitle: true,
        ),
        body: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 70,),
                  CustomTextField(ControllerTitle: FullName,
                      Labol: 'Full Name',
                      Validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty)
                          return ' Pleas Enter Your Email';
                      }),
                  SizedBox(height: 20,),
                  CustomTextField(ControllerTitle: Email,
                      Labol: 'E_mail',
                      Validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty)
                          return ' Pleas Enter Your Email';
                      }),
                  SizedBox(height: 20,),
                  CustomTextField(
                    suffics: GestureDetector(
                        onTap: () {
                          print(isVasible);
                          setState(() {
                            isVasible = !isVasible;
                          });
                        },
                        child: isVasible == true ? Icon(
                          Icons.visibility_off_outlined, size: 28,
                          color: theme.primaryColor,) : Icon(
                            Icons.visibility_outlined, size: 25,
                            color: theme.primaryColor)),
                    ControllerTitle: Password,
                    Labol: 'Passwword',
                    Validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty)
                        return ' Pleas Enter Your password';
                    },
                    obscure: isVasible,
                  ),
                  SizedBox(height: 20,),
                  CustomTextField(
                    suffics: GestureDetector(
                        onTap: () {
                          print(isVasible);
                          setState(() {
                            isVasible = !isVasible;
                          });
                        },
                        child: isVasible == true ? Icon(
                          Icons.visibility_off_outlined, size: 28,
                          color: theme.primaryColor,) : Icon(
                            Icons.visibility_outlined, size: 25,
                            color: theme.primaryColor)),
                    ControllerTitle: ConfirmPassword,
                    Labol: ' Confirm Passwword',
                    Validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty)
                        return ' Pleas Enter Your password';
                    },
                    obscure: isVasible,
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(onPressed: () async{
                    Navigator.pushNamed(context, LoginView.routeName);
                    if(FormKey.currentState!.validate()){

                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: Email.text,
                          password: Password.text,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      }catch (e) {
                        print(e);
                      }

                    }

                  }, child: Container(height: 65,
                    decoration:
                    BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Login',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: Colors.white),),
                            Icon(Icons.arrow_forward, size: 32,
                              color: Colors.white,)
                          ]),

                    ),
                  ),),
                  SizedBox(height: 20,),

                ]),
          ),
        ),
      ),
    );
}


  }



//var reg= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//if(! reg.hasMatch(value))
//return'Invalid Email ';
