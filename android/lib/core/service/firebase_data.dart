import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/home/model/room_model.dart';
import '../../features/home/model/user_profile.dart';

class FireBaseData{
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String get myUserId => firebaseAuth.currentUser!.uid;

  Future createUser(UserProfile userProfile) async{
    try {
      await fireStore
          .collection('users')
          .doc(userProfile.id)
          .set(userProfile.toJson());
      print("User secces created ");
    } catch (e) {
      print("error when you created user $e");
    }
  }

  Stream <List<UserProfile>> getAllUsers(){
    return fireStore.collection('users').snapshots().map((snapshot){
      return snapshot.docs
          .map((doc)=>UserProfile.fromJson(doc.data()))
          .toList();
    });
  }
  Stream<List<UserProfile>> getAllUsersWithoutMe(){
    return fireStore.collection('users').snapshots().map((snapshot){
      return snapshot.docs
          .map((doc)=> UserProfile.fromJson(doc.data()))
          .where((user)=>user.id != myUserId)
          .toList();
    });
  }

  Future createRoom(String userId) async {

    final sortMember = [myUserId , userId]..sort((a,b)=>a.compareTo(b));



    CollectionReference chatroom =await fireStore.collection('rooms');
    QuerySnapshot existRoom = await chatroom.where('members', isEqualTo: sortMember).get();

    if(existRoom.docs.isNotEmpty){
      return existRoom.docs.first.id;
    }else {
      String chatRoomId = fireStore.collection('rooms').doc().id;
      try {
        RoomModel r = RoomModel(
            id: chatRoomId,
            lastMessage: "",
            lastMessageTime: DateTime.now().toIso8601String(),
            members: sortMember,
            createdAt: DateTime.now().toIso8601String(),
        );

        await fireStore.collection('rooms').doc(chatRoomId).set(r.toJson());
      } catch (error) {
        return(error.toString());
      }
    }


  }
  
  Stream<List<RoomModel>>getAllRooms(){
    return fireStore.collection('users')
    .where('Members',arrayContains: myUserId)
    .snapshots()
        .map((snapshot){
          return snapshot.docs
              .map((doc)=>RoomModel.fromJson(doc.data()))
              .toList();
    });
  }

}