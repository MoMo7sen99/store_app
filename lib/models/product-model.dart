class ProductModel
{
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });


  factory ProductModel.fromJson(data) {
    return ProductModel(
        id:             data["id"] ,
        title:          data['title'] ,
        price:          data['price'] ,
        description:    data['description'] ,
        category:       data['category'] ,
        image:          data['image'],
    );
  }
}






