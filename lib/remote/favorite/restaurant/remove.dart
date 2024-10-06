import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class RemoveRestaurantFavorite {
  Crud crud;
  RemoveRestaurantFavorite(this.crud);
  post(
    String userId,
    String restaurantId,
  ) async {
    var response = await crud.postData(AppLink.removeRestaurantFavorite, {
      "user_id": userId,
      "restaurant_id": restaurantId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
