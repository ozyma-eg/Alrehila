import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class StoreData {
  Crud crud;
  StoreData(this.crud);
  postdata(
    String country,
  ) async {
    var response = await crud.postData(
      AppLink.store,
      {
        "country": country,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
