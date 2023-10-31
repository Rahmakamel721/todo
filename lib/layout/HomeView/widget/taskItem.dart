import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/model/TaskModel.dart';

import '../../../networkLayer/FireStor.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItem({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return


      Container(
        margin:  EdgeInsets.symmetric(vertical: 20,horizontal: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
              color: Color(0xFFEC4B4B,
        )),

        child:
      Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [  SlidableAction(
    onPressed: (context)async { 
      await FireStorUtils.DeletDataFromFirestore(taskModel);
    },
    backgroundColor:  const Color(0xFFEC4B4B),
    foregroundColor: Colors.white,
    icon: Icons.delete,
    label: 'Delete',
    ),],),
    child: Container( height: 115,
    width: 400,
    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),

    decoration: BoxDecoration(  color: Colors.white,
    borderRadius: BorderRadius.circular(20)),
    child:
    Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
    width: 8,
    height: 100,
    decoration: BoxDecoration( color: theme.primaryColor,
    borderRadius: BorderRadius.circular(8)),),
    Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Text(taskModel.Title,style: theme.textTheme.bodyLarge,),
    Text(taskModel.Description,style: theme.textTheme.bodyMedium,),
    Row(
    children: [ Icon(Icons.alarm,size: 18),
    Text('10:30 AM',style: theme.textTheme.bodySmall,)],)
    ],),
    Container(
    width: 70,
    height:30 ,
    decoration: BoxDecoration(
    color: theme.primaryColor,
    borderRadius: BorderRadius.circular(10)),
    child: Icon(Icons.check),
    )

    ]),
    ),
    ),


      );
  }
}
