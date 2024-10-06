import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class CountryData {
  Crud crud;
  CountryData(this.crud);
  postdata(
    String country,
  ) async {
    var response = await crud.postData(
      AppLink.country,
      {
        "country": country,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
