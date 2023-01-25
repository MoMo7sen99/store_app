import 'package:flutter/material.dart';
import 'package:storeapp/models/product-model.dart';
import 'package:storeapp/modules/update_product_screen.dart';

class ItemWidget extends StatelessWidget {
   ItemWidget({
    required this.product,
    Key? key,
  }) : super(key: key);

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateScreen.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.white,
            height:100,
            child: Card(
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height:3 ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text( r"$" "${product.price.toString()}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.favorite, color: Colors.red,) ,
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -85,
            right: 15,
            child: Image.network(product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}