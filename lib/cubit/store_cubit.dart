import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/services/update_product.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  Future<void> updateProduct ({
    required String productName,
    required String description,
    required String image,
    required String price,
    required String category,
    required int id,
  }) async {
    isLoading = true;
    emit(StoreUpdateProductLoading());

    try {
      await UpdateProductService().updateProduct(id: id , title: productName, price: price, description: description, category: category, image: image,);
      isLoading = false;
      print("success");
      emit(StoreUpdateProductSuccess());
      print(price.toString());
    } catch (e) {
      isLoading = false;
      emit(StoreUpdateProductFailure());
      print(e.toString());
    }
  }


}
