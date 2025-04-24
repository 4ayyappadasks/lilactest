import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:japx/japx.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/common/common_toast/toast.dart';
import 'package:machinetestlilac/core/Baseurl/baseurl.dart';
import 'package:machinetestlilac/model/requestotp.dart';
import 'package:machinetestlilac/view/messagescreen/ui.dart';

class Otpscreencontroller extends GetxController {
  var otploading = false.obs;
  var otp = "0".obs;

  Requestotp ? requestotp;
  final box = GetStorage();
  verifyotp({required String otp, required String number}) async {
    print("otp : $otp , number $number");
    try {
      otploading.value = true;
      final response = await http.post(
        Uri.parse("$BASEURL/auth/registration-otp-codes/actions/phone/verify-otp"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "data": {
            "type": "registration_otp_codes",
            "attributes": {
              "phone": number,
              "otp": int.parse(otp),
              "device_meta": {
                "type": "web",
                "name": "HP Pavilion 14-EP0068TU",
                "os": "Linux x86_64",
                "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
                "browser_version": "112.0.2",
                "user_agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
                "screen_resolution": "1600x900",
                "language": "en-GB"
              }
            }
          }
        }),
      );
      log("response.body ${response.body}");
      if (response.statusCode == 200) {
        otploading.value = false;
        final decoded = Japx.decode(jsonDecode(response.body));
        final data = jsonEncode(decoded);
        log("otp decodedd : $data");
        // log("otp decodedd : $decoded");
        requestotp = requestotpFromJson(data);
        // print("accessToken : ${user.authStatus.accessToken}");
        box.write('accessToken', requestotp?.data.authStatus.accessToken);
        box.write('userchatid', requestotp?.data.id);
        log("requestotp : $decoded");
        Navi.to(MeassageScreen());
      } else {
        otploading.value = false;
        log("Failed to verify OTP: ${response.body}");
        CommonToast(message: "OTP verification failed");
      }
    } catch (e) {
      otploading.value = false;
      log("error in request otp : $e");
      Get.snackbar("Error", "Something went wrong");
    }
  }

}
