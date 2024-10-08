import 'package:aplikasi_sederhana/common/extensions/int_ext.dart';

class ProductModel {
  final List<String> images;
  final String name;
  final int price;

  ProductModel({
    required this.images,
    required this.name,
    required this.price,
  });

  String get priceFormat => price.currencyFormatRp;
}
