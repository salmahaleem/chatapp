import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/login/model/login_model.dart';
import '../../features/register/model/register_model.dart';
import '../../features/home/model/user_profile.dart';
import 'firebase_data.dart';

class FirebaseService{
  final FirebaseAuth authe = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


 Future<User?>login(LoginModel loginModel) async {

   try {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: loginModel.email,
         password: loginModel.password
     );
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
     }
   }

 }

  Future<User?> register(RegisterModel registerModel) async {
    try {
      final credential = await authe.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );

      User? user = credential.user;

      if (user != null) {
        UserProfile userProfile = UserProfile(
          id: user.uid,
          name: registerModel.name,
          email: registerModel.email,
          phone: registerModel.phone,
          createdAt: DateTime.now().toIso8601String(),
          about: "New user",
          online: true,
          lastActivated: DateTime.now().toIso8601String(),
          pushToken: 'example-push-token',
        );

        await FireBaseData().createUser(userProfile);
      }

      return user;
    } catch (e) {
      print('Registration error: $e');
      return null;
    }
  }
Future<void> createUserProfile (UserProfile userProfile)async{
  try {
    await firestore
        .collection('users')
        .doc(userProfile.id)
        .set(userProfile.toJson());
    print('User profile created successfully!');
  } catch (e) {
    print('Error creating user profile: $e');
  }
}

Future<void> logout()async{
   try{
     await authe.signOut();
   }
   catch(error){
     print("error is $error");
   }
}

}