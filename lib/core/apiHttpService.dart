import 'dart:convert';
import 'package:http/http.dart' as http;

import '../configs/apiConfig.dart';

class APIHTTP {
  static Future<dynamic> post(url, [dynamic datas, dynamic funcID]) async {
    var headers = <String, String>{"Content-Type": "application/x-www-form-urlencoded"};
    var _headers = {
      "HRM-Api-Url": url,
      "HRM-Function-ID": 'funcID',
      "HRM-Request-Url": "HrmMobileApp",
      "HRM-Api-Type": "HrmMobileApp",
      "HRM-Application-ID": "HrmMobileApp",
    };
    // const loginInfo = this.authStore.get();
    // if (loginInfo) {
    //   _headers["HRM-Session-ID"] = loginInfo.SessionID;
    //   _headers["HRM-Token-ID"] = loginInfo.TokenID;
    //   _headers["HRM-JWT-ID"] = loginInfo.Jwt;
    // }
    var urlencoded = "headers=" + Uri.encodeComponent(jsonEncode(_headers));
    if (datas != null) {
      urlencoded += "&payload=" + Uri.encodeComponent(jsonEncode(datas));
    }
    var result = await http.post(Uri.parse(ApiConfig.apiUrl + 'ApiHandler/Call'),
        headers: headers, body: urlencoded);
    return jsonDecode(result.body);
    // if (res && !res.ErrorCode && !res.ErrorLogin && !res.Error) {
    //   res.Data = JSON.parse(res?.Data)
    //   return res;
    // }
    // else{
    //   const error = res ? res.ErrorCode || res.ErrorLogin || res.Error : "Error";
    //   const objError = this.CommonHandler.GetErrorMessage(error);
    //   this.InitValidateAlert(objError);
    // }
  }
}
