import 'package:pragma_cats/core/config.dart';
import 'package:pragma_cats/features/home/data/models/cat_model.dart';

abstract interface class HomeDataSource {
  Future<List<CatModel>> getCats();
}

class HomeDataSourceImpl implements HomeDataSource {
  final AppNetwork appNetwork;
  HomeDataSourceImpl(this.appNetwork);

  @override
  Future<List<CatModel>> getCats() async {
    try {
      final catsList =
          await appNetwork.get(url: "https://api.thecatapi.com/v1/breeds");
      return List<Map<String, dynamic>>.from(catsList)
          .map((cat) => CatModel.fromJson(cat))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
