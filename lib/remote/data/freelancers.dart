import '../../link_api.dart';
import '../../../tools/class/c_r_u_d.dart';

class FreelancersData {
  Crud crud;
  FreelancersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.freelancers, {});
    return response.fold((l) => l, (r) => r);
  }
}
