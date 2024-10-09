import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/presentation/blocs/product_bloc.dart';
import 'package:flutter_challenge/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter_challenge/presentation/widgets/product_card_widget.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          switch (state) {
            case ProductInitial():
              context.read<ProductBloc>().add(FetchProducts());
              return const Center(child: CircularProgressIndicator());
            case ProductLoading():
              return const Center(child: CircularProgressIndicator());
            case ProductLoaded():
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCardWidget(
                      product: product,
                      onTap: () =>
                          context.go('/product/${product.id}', extra: product),
                    );
                  },
                ),
              );
            case ProductError():
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
