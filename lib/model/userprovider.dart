import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

DocumentSnapshot ds;
DocumentSnapshot ds5;

class UserProvider extends ChangeNotifier {
  String name;
  final Firestore _db = Firestore.instance;
  CollectionReference ref;
  final String path;

  UserProvider(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }

  DocumentSnapshot searchUser(String email) {
    Firestore.instance
        .collection('user')
        .where("email", isEqualTo: email)
        .snapshots()
        .listen(
          (data) => data.documents.forEach(
            (doc) {
              ds = doc;
            },
          ),
        );
    return ds;
  }

  String getName(String email) {
    Firestore.instance
        .collection('user')
        .where("email", isEqualTo: email)
        .snapshots()
        .listen(
          (data) => data.documents.forEach(
            (doc) {
              ds = doc;
            },
          ),
        );
    return ds['name'];
  }
}
