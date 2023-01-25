import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/cubit/store_cubit.dart';
import 'package:storeapp/models/product-model.dart';
import 'package:storeapp/services/update_product.dart';
import '../widgets/custom-bottom.dart';
import '../widgets/form_field.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({Key? key}) : super(key: key);

  static String id = "UpdateScreen" ;

  bool isLoading = false;

  late String productName, description, image, price,category;


  @override
  Widget build(BuildContext context) {

    ProductModel product = ModalRoute
        .of(context)!
        .settings
        .arguments as ProductModel;

     productName = product.title;
     description = product.description;
     image = product.image;
     price = product.price.toString();
    category = product.category;


    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StoreCubit.get(context);

          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text("Update Product",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 75,),
                      CustomFormField(
                        value: productName,
                        hint: "Product Name",
                        onChanged: (value) {
                          productName = value;
                        },
                      ),
                      CustomFormField(
                        value: description,
                        hint: "Description",
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                      CustomFormField(
                        value: price,
                        hint: "Price",
                        inputType: TextInputType.number,
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      CustomFormField(
                        value: image,
                        hint: "image",
                        onChanged: (value) {
                          image = value;
                        },
                      ),
                      const SizedBox(height: 40,),
                      CustomBottom(
                        onPressed: () async{
                          await cubit.updateProduct(productName: productName, description: description, image: image, price: price, category: category, id: product.id);
                        },
                      )
                    ],
                  ),
                )
            ),
          );
        },
      ),
    );
  }
}



