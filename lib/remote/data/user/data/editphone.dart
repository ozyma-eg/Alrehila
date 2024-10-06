import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class EditPhone {
  Crud crud;
  EditPhone(this.crud);
  postData(
    String email,
    String phone,
  ) async {
    var response = await crud.postData(AppLink.userphone, {
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
