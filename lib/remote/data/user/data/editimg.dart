import 'dart:io';
import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class EditImg {
  Crud crud;
  EditImg(this.crud);
  postData(
    Map data,
    File file,
  ) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.userimg,
      data,
      file,
    );
    return response.fold((l) => l, (r) => r);
  }
}
