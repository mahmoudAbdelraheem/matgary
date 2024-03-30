import '../../../apis_link.dart';
import '../../../core/class/crud.dart';

class AddressData {
  final CrudImp crudImp;

  AddressData({required this.crudImp});
  viewData({required String userId}) async {
    var response = await crudImp.postData(ApiLink.viewAddress, {
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData({required String addressId}) async {
    var response = await crudImp.postData(ApiLink.removeAddress, {
      'addressid': addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateData({
    required String addressId,
    required String name,
    required String street,
    required String city,
    required String lat,
    required String long,
  }) async {
    var response = await crudImp.postData(ApiLink.updateAddress, {
      'addressid': addressId,
      'name': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData({
    required String userId,
    required String name,
    required String street,
    required String city,
    required String lat,
    required String long,
  }) async {
    var response = await crudImp.postData(ApiLink.addAddress, {
      'userid': userId,
      'name': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }
}
