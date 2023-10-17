import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/layout/HomeView/widget/taskItem.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Column(
        children: [
          Stack(alignment: Alignment(0,8), children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              height: 140,
              width: double.infinity,
              color: theme.primaryColor,
              child: Text(
                'To Do List',
                style: theme.textTheme.titleLarge,
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: theme.primaryColor,
              activeBackgroundDayColor: Colors.white,
              dotsColor: Colors.black,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            )
          ]),
          SizedBox(height: 60,),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,itemBuilder:(context, index) => TaskItem(),
            itemCount: 20,),
          )



        ],
      );
  }
}
