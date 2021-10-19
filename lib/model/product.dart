// import 'dart:convert';

class Product {
  final String id;
  final String name;
  final String price;
  final String created;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.created});

  factory Product.getProducts(Map<String, dynamic> object) {
    return Product(
      id: object['id'],
      name: object['name'],
      price: object['job'],
      created: object['createdAt'],
    );
  }
}

// Future<Product> getProductsAPI(String name, String job) async {
//   String apiURL = "https://reqres.in//api/users";

//   var result = await http.post(apiURL, body: {
//     "name": name,
//     "job": job,
//   });

//   var jsonResult = json.decode(result.body);
//   // var userData = (jsonrESULT as Map<String, dynamic>)['data'];

//   return Product.getProductsAPI(jsonResult);
// }
