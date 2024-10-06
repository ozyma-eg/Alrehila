import '../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postdata(
    String email,
    String verifycode,
  ) async {
    var response = await crud.postData(
      AppLink.verifycode,
      {
        "email": email,
        "verifycode": verifycode,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
