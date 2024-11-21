import 'package:pragma_cats/features/home/domain/entities/cat.dart';

class SearchCatUsecase {
  List<Cat> call(String query, List<Cat> listCats) {
    if (query.isEmpty) {
      return listCats;
    }
    return listCats
        .where((cat) => cat.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
