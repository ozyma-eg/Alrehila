import '../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    var response = await crud.postData(
      AppLink.signUp,
      {
        "username": username,
        "password": password,
        "email": email,
        "phone": phone
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
