import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class RemovePlaceFavorite {
  Crud crud;
  RemovePlaceFavorite(this.crud);
  post(
    String userId,
    String placeId,
  ) async {
    var response = await crud.postData(AppLink.removePlaceFavorite, {
      "user_id": userId,
      "place_id": placeId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
