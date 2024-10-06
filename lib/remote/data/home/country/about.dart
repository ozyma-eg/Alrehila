import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class AboutData {
  Crud crud;
  AboutData(this.crud);
  postdata(
    String country,
  ) async {
    var response = await crud.postData(
      AppLink.about,
      {
        "country": country,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
