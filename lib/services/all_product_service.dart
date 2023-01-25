import 'package:storeapp/helper/api.dart';
import '../models/product-model.dart';


class AllProductService
{


  Future<List<ProductModel>> getAllProducts () async {

    List data = await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> allProductsList = [];


    for (int i=0; i < data.length; i++ )
    {
      allProductsList.add(ProductModel.fromJson(data[i]));
    }
    return allProductsList ;
  }


}