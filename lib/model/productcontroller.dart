import 'package:flutter/cupertino.dart';
import 'package:flutter_dingdong/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';

class ProductController extends ChangeNotifier {
  List<Product> products;
  Product product;
  final Firestore _db = Firestore.instance;
  CollectionReference ref;
  final String path;
  ProductController(this.path) {
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

  Future<DocumentReference> addDocument(Map data) async {
    return await ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }

  Future<List<Product>> fetchProducts() async {
    var result = await ref.getDocuments();
    products = result.documents.map((f) {
      return Product.fromMap(f.data, f.documentID);
    }).toList();
    return products;
  }
}
