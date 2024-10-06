import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class AddPlaceFavorite {
  Crud crud;
  AddPlaceFavorite(this.crud);
  post(
    String userId,
    String placeId,
  ) async {
    var response = await crud.postData(AppLink.addPlaceFavorite, {
      "user_id": userId,
      "place_id": placeId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
