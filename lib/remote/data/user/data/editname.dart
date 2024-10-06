import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class EditName {
  Crud crud;
  EditName(this.crud);
  postData(
    String email,
    String name,
  ) async {
    var response = await crud.postData(AppLink.username, {
      "email": email,
      "name": name,
    });
    return response.fold((l) => l, (r) => r);
  }
}
