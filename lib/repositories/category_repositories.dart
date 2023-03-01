import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/category_model.dart';
import '../models/user_model.dart';
import '../services/firebase_service.dart';

class CategoryRepository{
  CollectionReference<CategoryModel> categoryRef = FirebaseService.db.collection("categories")
      .withConverter<CategoryModel>(
    fromFirestore: (snapshot, _) {
      return CategoryModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
    Future<List<QueryDocumentSnapshot<CategoryModel>>> getCategories() async {
    try {
      var data = await categoryRef.get();
      bool hasData = data.docs.isNotEmpty;
      if(!hasData){
        makeCategory().forEach((element) async {
          await categoryRef.add(element);
        });
      }
      final response = await categoryRef.get();
      var category = response.docs;
      return category;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<DocumentSnapshot<CategoryModel>>  getCategory(String categoryId) async {
      try{
        print(categoryId);
        final response = await categoryRef.doc(categoryId).get();
        return response;
      }catch(e){
        rethrow;
      }
  }

  List<CategoryModel> makeCategory(){
      return [
        CategoryModel(categoryName: "Highlighter", status: "active", imageUrl: "https://cdn.shopify.com/s/files/1/1699/6985/products/rarebeautyMesmerize_800x.png?v=1670413503"),
        CategoryModel(categoryName: "Blush", status: "active", imageUrl: "https://www.sephora.com/productimages/sku/s2618817-av-7-zoom.jpg"),
        CategoryModel(categoryName: "Lip", status: "active", imageUrl: "https://cdn-cf.ipsy.com/contentAsset/image/a9123fe3-d643-4924-8b8b-fb38fcd0b164/fileAsset?byInode=1"),
        CategoryModel(categoryName: "Eye", status: "active", imageUrl: "http://cdn.shopify.com/s/files/1/0314/1143/7703/products/LIQUID_LINER-SKU-1.jpg?v=1630031335"),
        CategoryModel(categoryName: "Face", status: "active", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSpVnkBP4AXPJfHudzevDkh91cZLNoBWppbg&usqp=CAU"),
      ];
  }



}