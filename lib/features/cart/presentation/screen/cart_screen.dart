
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart',style: Theme.of(context).textTheme.bodyMedium,),),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Icon(Icons.shopping_cart_outlined, size: 100,color: Theme.of(context).colorScheme.onSurfaceVariant,),
            SizedBox(height: 12),
            Text(
              'YOUR CART IS EMPTY',
              style: TextStyle(fontSize: 18,fontWeight:FontWeight.normal,color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
