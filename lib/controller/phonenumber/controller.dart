import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/core/Baseurl/baseurl.dart';
import 'package:machinetestlilac/view/otpscreen/ui.dart';

class PhonescreenController extends GetxController {
  var phonenumber = 0.obs;
  var countrycode = 91.obs;
  var requestotploading = false.obs;
  requestotp({required String number}) async{
    try {
      print("number given : $number");
      requestotploading.value = true;
      var response = await http.post(
        Uri.parse(
          "${BASEURL}/auth/registration-otp-codes/actions/phone/send-otp",
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "data": {
            "type": "registration_otp_codes",
            "attributes": {"phone": "+$number"}
          }
        }),
      );
      if(response.statusCode==200)
        {
          print("success");
          requestotploading.value = false;
          Navi.to(otpscreen(number: "+$number",));
          var res = jsonDecode(response.body);
          Get.snackbar("OTP", res["data"].toString());
        }
      else
        {
          print("error");
          requestotploading.value = false;
          log(response.body);
        }
    } catch (e) {
      log("error in otp request $e");
      requestotploading.value = false;
    }
  }
}
