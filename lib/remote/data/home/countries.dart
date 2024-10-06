import '../../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class CountriesData {
  Crud crud;
  CountriesData(this.crud);
  getData(
    String id,
  ) async {
    var response = await crud.postData(AppLink.countries, {
      "id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
