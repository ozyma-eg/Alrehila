import '../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class Favorite {
  Crud crud;
  Favorite(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.favorite, {
      "id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
