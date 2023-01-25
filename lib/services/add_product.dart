
import 'package:storeapp/helper/api.dart';
import '../models/product-model.dart';

class AddProduct
{
  Future<ProductModel> addProduct ({
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
  })async{

    Map<String,String> body = {
      'title' : title,
      'price' : price,
      'description' : description,
      'category' :category,
      'image' : image ,
    };
    Map<String,dynamic> data = await Api().put(url: "https://fakestoreapi.com/products" , body: body);

    return ProductModel.fromJson(data) ;
  }
}