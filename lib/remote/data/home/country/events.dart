import '../../../../link_api.dart';
import '../../../../tools/class/c_r_u_d.dart';

class EventsData {
  Crud crud;
  EventsData(this.crud);
  postdata(
    String country,
  ) async {
    var response = await crud.postData(
      AppLink.events,
      {
        "country": country,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
