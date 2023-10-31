import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/layout/HomeLayout/HomeLayout.dart';
import 'package:todo/layout/HomeView/HomeView.dart';

import '../../core/CustomerTextField.dart';
import '../Register/Register.dart';

class LoginView extends StatefulWidget {
  static const routeName="login";
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    bool isVasible = false;
    var formKeyy = GlobalKey<FormState>();
    var theme = Theme.of(context);
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
          title: Text('Login', style: theme.textTheme.titleLarge),
          centerTitle: true,
        ),
        body: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKeyy,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 70,),
                  Text('WELCOME BACK!',
                    style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.black),),
                  SizedBox(height: 40,),
                  CustomTextField(ControllerTitle: Email,
                      Labol: 'E_mail',
                      Validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty)
                          return ' Pleas Enter Your Email';
                      }),
                  SizedBox(height: 20,),
                  CustomTextField(suffics: GestureDetector(
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

                  Align(alignment: Alignment.centerLeft,
                      child: TextButton(onPressed: () {},
                          child: Text('forget password !',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: Colors.black),))),
                  SizedBox(height: 20,),
                  MaterialButton(onPressed: () async {
                    Navigator.pushNamed(context, HomeLayout.routeName);
                    if (formKeyy.currentState!.validate()){
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: Email.text,
                            password: Password.text,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
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
                  Align(alignment: Alignment.centerLeft,
                      child: TextButton(onPressed: () {
                        Navigator.pushNamed(context, RegisterView.routeName);
                      },
                          child: Text('Creat New Acc',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: Colors.black),)))
                ]),
          ),
        ),
      ),
    );
  }


}












