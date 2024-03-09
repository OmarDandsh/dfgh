import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(userInfoMap);
  }
  Future addFoodItem1(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(userInfoMap);
  } Future addFoodItem2(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(userInfoMap);
  }
  Future<Stream<QuerySnapshot>> getFoodItem1(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
 Future<Stream<QuerySnapshot>> getFoodItem2(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }


  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future<void> deleteFoodItem(String collectionName, String docId) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId) // يجب توفير معرف الوثيقة هنا
        .delete();
  }
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getItemsByFilter(String collectionName, {String? nationality, String? religion,String? maritalstatus}) {
    Query collectionQuery = firestore.collection(collectionName);

    if (nationality != null && nationality != 'جميع الجنسيات') {
      collectionQuery = collectionQuery.where('nationality', isEqualTo: nationality);
    }

    if (religion != null && religion != 'جميع الديانات') {
      collectionQuery = collectionQuery.where('Religion', isEqualTo: religion);
    }
    if (maritalstatus != null && maritalstatus != 'الحالة الاجتماعية') {
      collectionQuery = collectionQuery.where('maritalstatus', isEqualTo: maritalstatus);
    }

    return collectionQuery.snapshots();
  }

}