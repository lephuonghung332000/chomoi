import 'package:chomoi/domain/models/response/brand/brand_model.dart';

class BrandSelectionViewModel {
  final String name;
  final String image;

  BrandSelectionViewModel({
    required this.name,
    required this.image,
  });

  factory BrandSelectionViewModel.fromBrand(BrandModel brandModel) {
    return BrandSelectionViewModel(
      name: brandModel.name,
      image: brandModel.image,
    );
  }
}
