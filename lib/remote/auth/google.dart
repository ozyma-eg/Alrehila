import '../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class GoogleLogin {
  Crud crud;
  GoogleLogin(this.crud);
  postdata(
    String username,
    String email,
    String img,
    String option,
  ) async {
    var response = await crud.postData(AppLink.googlelogin, {
      "username": username,
      "email": email,
      "img": img,
      "options": option,
    });
    return response.fold((l) => l, (r) => r);
  }
}
