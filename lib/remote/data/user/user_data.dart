import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class GetUserData {
  Crud crud;
  GetUserData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLink.getUserData, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
