import '../helper/api.dart';


class AllCategoriesService
{
   Future<List> getAllCategories () async
   {

     List data = await Api().get(url: 'https://fakestoreapi.com/products/categories');

     return data;
   }

}