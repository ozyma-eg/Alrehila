import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class RemoveEventFavorite {
  Crud crud;
  RemoveEventFavorite(this.crud);
  post(
    String userId,
    String eventId,
  ) async {
    var response = await crud.postData(AppLink.removeEventFavorite, {
      "user_id": userId,
      "event_id": eventId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
