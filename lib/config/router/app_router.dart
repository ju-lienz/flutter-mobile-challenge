import 'package:flutter/material.dart';
import 'package:flutter_challenge/domain/entities/product.dart';
import 'package:flutter_challenge/presentation/pages/home_page.dart';
import 'package:flutter_challenge/presentation/pages/product_detail_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (BuildContext context, GoRouterState state) {
        final product = state.extra as Product;
        return ProductDetailPage(product: product);
      },
    ),
  ],
);
