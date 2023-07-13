import 'package:ecommers_and_chat_app_with_bwa/presentation/models/product_model.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/categories_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_state.g.dart';

@riverpod
class ProductsState extends _$ProductsState {
  final runingProduct = [
    ProductModel(
      poster: Assets.assetsImagesProductsRuningShoes11,
      images: [
        Assets.assetsImagesProductsRuningShoes11,
        Assets.assetsImagesProductsRuningShoes12,
        Assets.assetsImagesProductsRuningShoes13,
      ],
      categorie: 'Running',
      title: 'Running shoes 1',
      price: '\$54.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsRuningShoes21,
      images: [
        Assets.assetsImagesProductsRuningShoes21,
        Assets.assetsImagesProductsRuningShoes22,
        Assets.assetsImagesProductsRuningShoes23,
      ],
      categorie: 'Running',
      title: 'Running shoes 2',
      price: '\$80.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsRuningShoes31,
      images: [
        Assets.assetsImagesProductsRuningShoes31,
        Assets.assetsImagesProductsRuningShoes32,
        Assets.assetsImagesProductsRuningShoes33,
      ],
      categorie: 'Running',
      title: 'Running shoes 3',
      price: '\$67.80',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsRuningShoes41,
      images: [
        Assets.assetsImagesProductsRuningShoes41,
        Assets.assetsImagesProductsRuningShoes42,
        Assets.assetsImagesProductsRuningShoes43,
      ],
      categorie: 'Running',
      title: 'Running shoes 4',
      price: '\$60.00',
    ),
  ];
  final trainingProduct = [
    ProductModel(
      poster: Assets.assetsImagesProductsTrainningShoes11,
      images: [
        Assets.assetsImagesProductsTrainningShoes11,
        Assets.assetsImagesProductsTrainningShoes12,
        Assets.assetsImagesProductsTrainningShoes13,
      ],
      categorie: 'Training',
      title: 'Training shoes 1',
      price: '\$54.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsTrainningShoes21,
      images: [
        Assets.assetsImagesProductsTrainningShoes21,
        Assets.assetsImagesProductsTrainningShoes22,
        Assets.assetsImagesProductsTrainningShoes23,
      ],
      categorie: 'Training',
      title: 'Training shoes 2',
      price: '\$80.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsTrainningShoes31,
      images: [
        Assets.assetsImagesProductsTrainningShoes31,
        Assets.assetsImagesProductsTrainningShoes32,
        Assets.assetsImagesProductsTrainningShoes33,
      ],
      categorie: 'Training',
      title: 'Training shoes 3',
      price: '\$67.80',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsTrainningShoes41,
      images: [
        Assets.assetsImagesProductsTrainningShoes41,
        Assets.assetsImagesProductsTrainningShoes42,
        Assets.assetsImagesProductsTrainningShoes43,
      ],
      categorie: 'Training',
      title: 'Training shoes 4',
      price: '\$60.00',
    ),
  ];
  final basketballProduct = [
    ProductModel(
      poster: Assets.assetsImagesProductsBaskeballShoes11,
      images: [
        Assets.assetsImagesProductsBaskeballShoes11,
        Assets.assetsImagesProductsBaskeballShoes12,
        Assets.assetsImagesProductsBaskeballShoes13,
      ],
      categorie: 'Basketball',
      title: 'Basketball shoes 1',
      price: '\$54.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsBaskeballShoes21,
      images: [
        Assets.assetsImagesProductsBaskeballShoes21,
        Assets.assetsImagesProductsBaskeballShoes22,
        Assets.assetsImagesProductsBaskeballShoes23,
      ],
      categorie: 'Basketball',
      title: 'Basketball shoes 2',
      price: '\$80.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsBaskeballShoes31,
      images: [
        Assets.assetsImagesProductsBaskeballShoes31,
        Assets.assetsImagesProductsBaskeballShoes32,
        Assets.assetsImagesProductsBaskeballShoes33,
      ],
      categorie: 'Basketball',
      title: 'Basketball shoes 3',
      price: '\$67.80',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsBaskeballShoes41,
      images: [
        Assets.assetsImagesProductsBaskeballShoes41,
        Assets.assetsImagesProductsBaskeballShoes42,
        Assets.assetsImagesProductsBaskeballShoes43,
      ],
      categorie: 'Basketball',
      title: 'Basketball shoes 4',
      price: '\$60.00',
    ),
  ];
  final hikingProduct = [
    ProductModel(
      poster: Assets.assetsImagesProductsHikingShoes11,
      images: [
        Assets.assetsImagesProductsHikingShoes11,
        Assets.assetsImagesProductsHikingShoes12,
        Assets.assetsImagesProductsHikingShoes13,
      ],
      categorie: 'Hiking',
      title: 'Hiking shoes 1',
      price: '\$54.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsHikingShoes21,
      images: [
        Assets.assetsImagesProductsHikingShoes21,
        Assets.assetsImagesProductsHikingShoes22,
        Assets.assetsImagesProductsHikingShoes23,
      ],
      categorie: 'Hiking',
      title: 'Hiking shoes 2',
      price: '\$80.00',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsHikingShoes31,
      images: [
        Assets.assetsImagesProductsHikingShoes31,
        Assets.assetsImagesProductsHikingShoes32,
        Assets.assetsImagesProductsHikingShoes33,
      ],
      categorie: 'Hiking',
      title: 'Hiking shoes 3',
      price: '\$67.80',
    ),
    ProductModel(
      poster: Assets.assetsImagesProductsHikingShoes41,
      images: [
        Assets.assetsImagesProductsHikingShoes41,
        Assets.assetsImagesProductsHikingShoes42,
        Assets.assetsImagesProductsHikingShoes43,
      ],
      categorie: 'Hiking',
      title: 'Hiking shoes 4',
      price: '\$60.00',
    ),
  ];

  @override
  List<ProductModel> build() {
    final categoriesIndex = ref.watch(categoriesStateProvider);

    switch (categoriesIndex) {
      case 1:
        return runingProduct;
      case 2:
        return trainingProduct;
      case 3:
        return basketballProduct;
      case 4:
        return hikingProduct;
      default:
        return [
          ...runingProduct.take(2),
          ...trainingProduct.take(2),
          ...basketballProduct.take(2),
          ...hikingProduct.take(2)
        ];
    }
  }
}
