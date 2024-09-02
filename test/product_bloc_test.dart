import 'package:flutter_challenge/domain/entities/product.dart';
import 'package:flutter_challenge/infrastructure/api_service.dart';
import 'package:flutter_challenge/presentation/blocs/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

class MockApiService extends Fake implements ApiService {
  @override
  Future<List<Product>> fetchProducts() async {
    return [
      const Product(
          id: 1,
          title: 'Test Product',
          description: 'Test Description',
          image: 'https://example.com/image.jpg'),
    ];
  }
}

class MockApiServiceWithError extends Fake implements ApiService {
  @override
  Future<List<Product>> fetchProducts() async {
    throw Exception('Failed to fetch products');
  }
}

void main() {
  group('ProductBloc', () {
    late ApiService mockApiService;
    late ProductBloc productBloc;

    setUp(() {
      mockApiService = MockApiService();
      productBloc = ProductBloc(mockApiService);
    });

    tearDown(() {
      productBloc.close();
    });

    test('initial state is ProductInitial', () {
      expect(productBloc.state, isA<ProductInitial>());
    });

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductLoaded] when FetchProducts is added',
      build: () => ProductBloc(mockApiService),
      act: (bloc) => bloc.add(FetchProducts()),
      expect: () => [
        isA<ProductLoading>(),
        isA<ProductLoaded>(),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductError] when FetchProducts throws',
      build: () => ProductBloc(MockApiServiceWithError()),
      act: (bloc) => bloc.add(FetchProducts()),
      expect: () => [
        isA<ProductLoading>(),
        isA<ProductError>(),
      ],
    );
  });
}
