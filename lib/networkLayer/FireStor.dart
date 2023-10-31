import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/TaskModel.dart';


class FireStorUtils{

  static CollectionReference<TaskModel>GetCollection(){
  return FirebaseFirestore.instance.collection('Task').withConverter<TaskModel>(
      fromFirestore: (snapshot, _) =>TaskModel.fromFirestore(snapshot.data()!) ,
      toFirestore: (value, _) => value.toFireStore());

}

 static Future<void> AddDataFromFirestore( TaskModel model){

    var Collrction= GetCollection();
var docRef=Collrction.doc();
    model.Id= docRef.id;
return docRef.set(model);

  }



  static Future<void>DeletDataFromFirestore(TaskModel model){
  var Collrction= GetCollection();
  return Collrction.doc(model.Id).delete();
}

  static Future<List<TaskModel>> GetDataFromFirestore () async{
    var snapshot = await GetCollection().get();
      return snapshot.docs.map((element) =>element.data()).toList();
  }


  static Stream<QuerySnapshot<TaskModel>> GetRealTimeDataFromFirestore ( DateTime dateTime){
    var snapshot =  GetCollection().where('DataTime',isEqualTo:dateTime.microsecondsSinceEpoch ).snapshots();
return snapshot  ;
  }

















}