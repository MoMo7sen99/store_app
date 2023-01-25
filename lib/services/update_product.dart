
import '../helper/api.dart';
import '../models/product-model.dart';

class UpdateProductService
{
  Future<ProductModel> updateProduct ({
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
    required int id,
  })async{

    Map<String,String> body = {
      'title' : title,
      'price' : price,
      'description' : description,
      'category' :category,
      'image' : image ,
    };
    Map<String,dynamic> data = await Api().put(url: "https://fakestoreapi.com/products/${id}" , body: body);

    return ProductModel.fromJson(data) ;
  }
}