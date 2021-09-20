import 'package:cart_tul/domain/entities/product.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('Hit card');
        Navigator.of(context).pushNamed('/detail',
            arguments: Product('1', 'Producto1', 'sku', 'description', 'url'));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                width: 100, image: AssetImage('assets/images/soccer_ball.png')),
            SizedBox(
              height: 10,
            ),
            Text('Balón de futbol'),
            SizedBox(
              height: 5,
            ),
            Text('sku 465465'),
          ],
        ),
      ),
    );
  }
}
