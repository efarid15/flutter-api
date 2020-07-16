import 'dart:convert';
import 'package:http/http.dart' as http;

class PostApi {
  var sku;
  // ignore: non_constant_identifier_names
  String nameProduct;
  String description;
  String price;
  String message;
  String status;

  PostApi({
    this.sku, 
    this.nameProduct, 
    this.description,
    this.price,
    this.message,
    this.status
  });

  factory PostApi.createPostResult(Map <String, dynamic> object){
    
    return PostApi(
      sku: object['data']['sku'],
      nameProduct: object['data']['name_product'],
      description: object['data']['description'],
      price: object['data']['price'].toString(),
      message: object['data']['Message'],
      status: object['status'].toString()
    );
  }

  static Future<PostApi> connectToAPI(String sku, String nameProduct, String description, price) async
  {
    String apiUrl = "http://192.168.1.9:9090/products";
    var jsonBody = jsonEncode({
      "sku" : sku, 
      "name_product" : nameProduct,
      "description" : description,
      "price" : price
    }); 

    var apiResult = await http.post(apiUrl, body: jsonBody);
    var jsonResult = json.decode(apiResult.body);

    return PostApi.createPostResult(jsonResult);
  }
}