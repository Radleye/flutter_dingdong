import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DemandProvider extends ChangeNotifier {
  final Firestore _db = Firestore.instance;
  CollectionReference ref;
  final String path;

  DemandProvider(this.path) {
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
}
