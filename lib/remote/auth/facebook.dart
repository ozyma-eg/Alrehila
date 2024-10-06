import '../../link_api.dart';
import '../../tools/class/c_r_u_d.dart';

class FaceBookLogin {
  Crud crud;
  FaceBookLogin(this.crud);
  postdata(
    String username,
    String email,
    // String phone,
    String img,
  ) async {
    var response = await crud.postData(AppLink.facebooklogin, {
      "username": username,
      "email": email,
      // "phone": phone,
      "img": img,
    });
    return response.fold((l) => l, (r) => r);
  }
}
