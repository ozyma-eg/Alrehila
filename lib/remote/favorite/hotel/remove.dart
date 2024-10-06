import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class RemoveHotelFavorite {
  Crud crud;
  RemoveHotelFavorite(this.crud);
  post(
    String userId,
    String hotelId,
  ) async {
    var response = await crud.postData(AppLink.removeHotelFavorite, {
      "user_id": userId,
      "hotel_id": hotelId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
