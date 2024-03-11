class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ProductBrandDataModel brand;
  final String color;
  final String detailedDescription;

  ProductDataModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl, required this.brand, required this.color, required this.detailedDescription});

  
}

class ProductBrandDataModel{
  final String name;
  final String origin;
  final int establishedYear;

  ProductBrandDataModel({required this.name, required this.origin, required this.establishedYear});
}