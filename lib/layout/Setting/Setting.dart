import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
   SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      children: [Container(
        padding: EdgeInsets.only(left: 5),
        alignment: Alignment.centerLeft,
        height: 140,
        width: double.infinity,
        color: theme.primaryColor,
        child: Text(
          'Settings',
          style: theme.textTheme.titleLarge,
        ),
      ),
      ],
    ) ;
  }
}
