import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel
{
   String? Id;
  String Title;
  String Description;
  DateTime DataTime;
  bool  IsDone;
   TaskModel ({  this.Id ,required this.Title,required this.DataTime,required this.Description,required this.IsDone});


   factory TaskModel.fromFirestore( Map<String,dynamic>json ){
    return TaskModel(
        Id: json['Id'],
        Title: json['Title'] ,
        DataTime: DateTime.fromMillisecondsSinceEpoch(json['DataTime']) ,
        Description: json['Description'] ,
        IsDone: json['IsDone']);
   }

   Map<String,dynamic> toFireStore(){
     return{
       'Id':Id,
       'Title':Title,
       'Description':Description,
       'DataTime':DataTime.microsecondsSinceEpoch,
       'IsDone':IsDone
     };

   }
}


