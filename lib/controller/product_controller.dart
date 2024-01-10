import 'package:e_shop/model/product_model.dart';
import 'package:e_shop/server/global_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // Store product
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  //Get product
  Future<void> getProducts() async {
    try {
      var products = await GlobalService().getProucts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      throw Exception('👉 Error: $e');
    }
  }
}
