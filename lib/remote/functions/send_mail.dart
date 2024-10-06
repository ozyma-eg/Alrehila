import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class SendMail {
  Crud crud;
  SendMail(this.crud);
  sendData(
    String subject,
    String description,
    String usermail,
    String username,
    String userid,
  ) async {
    var response = await crud.postData(
      AppLink.sendMail,
      {
        "subject": subject,
        "description": description,
        "user_mail": usermail,
        "user_name": username,
        "user_id": userid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
