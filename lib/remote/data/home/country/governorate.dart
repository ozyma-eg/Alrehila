import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class GovernorateData {
  Crud crud;
  GovernorateData(this.crud);
  postdata(
    String governorate,
    String id,
  ) async {
    var response = await crud.postData(
      AppLink.governorate,
      {
        "governorate": governorate,
        "id": id,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
