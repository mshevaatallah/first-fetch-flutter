import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_1/models/product_models.dart';
import 'package:project_1/services/products_service.dart';
import 'package:project_1/widget/custom_loader.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ProductService productService = ProductService();
  List<Products> listProducts = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List People'),
      ),
      body: isLoading
          ? const CustomLoader()
          : Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: listProducts.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        onTap: () {},
                        isThreeLine: true,
                        title: Text(
                          listProducts[i].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender: ${listProducts[i].price}'),
                            Text('Height: ${listProducts[i].description}'),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
