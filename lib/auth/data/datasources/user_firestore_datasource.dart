import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/auth/data/models/user_model.dart';

class UserFirestoreDatSource {
  final FirebaseFirestore firestore;

  UserFirestoreDatSource({FirebaseFirestore? firestore})
    : firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap(), SetOptions(merge: true));
  }

  Future<UserModel?> getUserById(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      return UserModel.fromMap(doc.data()!);
    }

    return null;
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await firestore.collection('users').doc(uid).update(data);
  }

  Future<void> deleteUser(String uid) async {
    await firestore.collection('users').doc(uid).delete();
  }
}
