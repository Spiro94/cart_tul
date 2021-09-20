import 'package:cart_tul/domain/entities/product.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product1'),
        ),
        body: ListView(
          children: [
            Image(
              width: 200,
              height: 200,
              image: AssetImage('assets/images/soccer_ball.png'),
            ),
            Text(product.name),
            SizedBox(
              height: 10,
            ),
            Text(product.description),
          ],
        ));
  }
}
