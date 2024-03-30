import '../class/statuse_request.dart';

handlingData(response) {
  if (response is StatuseRequest) {
    return response;
  } else {
    return StatuseRequest.success;
  }
}
