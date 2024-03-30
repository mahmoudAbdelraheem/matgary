//! CRUD for (create , read , update , delete)

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/functions/check_internet_connection.dart';

abstract class Crud {
  //? for post data on database
  Future<Either<StatuseRequest, Map>> postData(String url, Map data);
}

class CrudImp extends Crud {
  @override
  Future<Either<StatuseRequest, Map>> postData(String url, Map data) async {
    try {
      //check internet connection
      if (await checkInternetConnection()) {
        //connect to the server
        http.Response response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody.toString());

          return Right(responseBody);
        } else {
          return const Left(StatuseRequest.serverFailuer);
        }
      } else {
        // if the decive is offline
        return const Left(StatuseRequest.offlineFailuer);
      }
    } catch (_) {
      return const Left(StatuseRequest.serverException);
    }
  }
}
