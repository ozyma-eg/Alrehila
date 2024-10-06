import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class AddRestaurantFavorite {
  Crud crud;
  AddRestaurantFavorite(this.crud);
  post(
    String userId,
    String restaurantId,
  ) async {
    var response = await crud.postData(AppLink.addRestaurantFavorite, {
      "user_id": userId,
      "restaurant_id": restaurantId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
