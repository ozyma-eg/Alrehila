import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class RemoveBeachFavorite {
  Crud crud;
  RemoveBeachFavorite(this.crud);
  post(
    String userId,
    String beachId,
  ) async {
    var response = await crud.postData(AppLink.removeBeachFavorite, {
      "user_id": userId,
      "beach_id": beachId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
