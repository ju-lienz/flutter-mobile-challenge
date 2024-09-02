import 'package:flutter/material.dart';
import 'package:flutter_challenge/domain/entities/product.dart';
import 'package:go_router/go_router.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        product.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        product.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {
          context.go('/product/${product.id}', extra: product);
        },
      ),
    );
  }
}
