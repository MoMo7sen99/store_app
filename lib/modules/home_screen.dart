import 'package:flutter/material.dart';
import 'package:storeapp/modules/update_product_screen.dart';
import 'package:storeapp/services/all_product_service.dart';

import '../models/product-model.dart';
import '../widgets/item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'HomeScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Store app",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart_rounded, color: Colors.black),
              onPressed: () {
                AllProductService().getAllProducts();
              },
            )
          ],
        ),


        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 85),

          child: FutureBuilder<List<ProductModel>>(

            future: AllProductService().getAllProducts(),

            builder: (context, snapshot) {
              if (snapshot.hasData){
                List<ProductModel> products = snapshot.data! ;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 65,
                    childAspectRatio: 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return ItemWidget(product: products[index],);
                  },
                );
              }else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }
          ),
        ));
  }
}
