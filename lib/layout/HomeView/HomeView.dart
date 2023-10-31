import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/layout/HomeView/widget/taskItem.dart';
import 'package:todo/model/TaskModel.dart';

import '../../networkLayer/FireStor.dart';

class HomeView extends StatelessWidget {

  DateTime SlectedDate=DateTime.now();
   HomeView({super.key});

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



              onDateSelected: ( date) {
                  SlectedDate= date;
              } ,

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
   child: StreamBuilder<QuerySnapshot<TaskModel>>(stream: FireStorUtils.GetRealTimeDataFromFirestore(SlectedDate ) , builder: (context, snapshot) {
     if(snapshot.hasError){
       return Column(
         children: [
           Text(snapshot.error.toString()),
         ],
       );
     }
     if(snapshot.connectionState==ConnectionState){
       return Center(
         child: CircularProgressIndicator(
           color: theme.primaryColor,
         ),
       );
     }
      var tasksList=snapshot.data?.docs.map((e) => e.data()).toList()??[];
     return ListView.builder(
         padding: EdgeInsets.zero,itemBuilder:(context, index) => TaskItem(taskModel:tasksList[index],),
          itemCount: tasksList.length,);
   } ),
 )
          //Expanded(
            //child: ListView.builder(
              //padding: EdgeInsets.zero,itemBuilder:(context, index) => TaskItem(),
           // itemCount: 20,),
         // )



        ],
      );
  }
}
