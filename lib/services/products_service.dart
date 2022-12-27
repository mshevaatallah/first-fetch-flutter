import 'package:http/http.dart' as http;
import 'package:project_1/models/product_models.dart';

class ProductService {
  Future<Products?> getItem() async {
    Products? products;
    var data;
    try {
      var response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      if (response.statusCode == 200) {
        data = Products.fromJson(response.body);
        print(data);
        return data;
      }
      return data;
    } catch (e) {
      return data;
    }
  }
}
