import 'package:flutter/material.dart';
import 'package:flutterapi/card_result.dart';
import 'package:flutterapi/post_api_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: avoid_init_to_null
  PostApi postApi = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API From Golang"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ProductCard(
                resultTitle: ((postApi != null)
                    ? ((postApi.status == "201")
                        ? postApi.nameProduct
                        : "Status : " + postApi.status)
                    : "Data Tidak Ada"),
                resultSubTitle: ((postApi != null)
                    ? ((postApi.status == "201")
                        ? postApi.description
                        : "Error : " + postApi.message)
                    : "Data Tidak Ada"),
              ),
              RaisedButton(
                onPressed: () {
                  PostApi.connectToAPI("COF-2037839", "Kopi Toraja",
                          "Merupakan kopi toraja asli", 30000)
                      .then((value) {
                    postApi = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
