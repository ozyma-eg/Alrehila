import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class EditMail {
  Crud crud;
  EditMail(this.crud);
  postData(
    String mail,
    String phone,
  ) async {
    var response = await crud.postData(AppLink.usermail, {
      "mail": mail,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
