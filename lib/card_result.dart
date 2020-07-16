import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  var resultTitle;
  var resultSubTitle;

  
  ProductCard({Key key, this.resultTitle, this.resultSubTitle})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      leading: Icon(Icons.album, size: 50),
      title: Text(widget.resultTitle),
      subtitle: Text(widget.resultSubTitle),
    );
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          listTile,
        ],
      ),
    );
  }
}
