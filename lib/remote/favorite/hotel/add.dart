import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class AddHotelFavorite {
  Crud crud;
  AddHotelFavorite(this.crud);
  post(
    String userId,
    String hotelId,
  ) async {
    var response = await crud.postData(AppLink.addHotelFavorite, {
      "user_id": userId,
      "hotel_id": hotelId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
