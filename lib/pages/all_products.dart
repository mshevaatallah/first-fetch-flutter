import 'package:flutter/material.dart';
import 'package:project_1/models/product_models.dart';
import 'package:project_1/services/people_services.dart';
import 'package:project_1/services/products_service.dart';
import 'package:project_1/widget/custom_loader.dart';

class ListPeople extends StatefulWidget {
  const ListPeople({Key? key}) : super(key: key);

  @override
  _ListPeopleState createState() => _ListPeopleState();
}

class _ListPeopleState extends State<ListPeople> {
  ProductService productService = ProductService();
  List<Products> listPeople = [];

  bool isLoading = true;

  getPeopleList() async {
    await productService.getItem().then((value) {
      setState(() {
        listPeople = value as List<Products>;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPeopleList();
  }

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
                  itemCount: listPeople.length,
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
                          listPeople[i].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender: ${listPeople[i].description}'),
                            Text('Height: ${listPeople[i].price}'),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
