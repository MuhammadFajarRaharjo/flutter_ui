// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String poster, categorie, title, price;
  final List<String> images;

  ProductModel({
    required this.poster,
    required this.images,
    required this.categorie,
    required this.title,
    required this.price,
  });
}
