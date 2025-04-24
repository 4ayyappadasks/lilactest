import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:japx/japx.dart';
import 'package:machinetestlilac/common/common_toast/toast.dart';
import 'package:machinetestlilac/core/Baseurl/baseurl.dart';
import 'package:machinetestlilac/model/messages.dart';

class MessagelistscreenCOntroller extends GetxController {
  var messageloading = false.obs;
  final box = GetStorage();
  Messagelistm? messagelistm;
  messagelist() async{
    try {
      messageloading.value = true;
      var response = await http.get(
        Uri.parse("$BASEURL/chat/chat-messages/queries/contact-users"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('accessToken')}',
        },
      );
      log("response = ${response.body}");
      if (response.statusCode == 200) {
        messageloading.value = false;
        final decoded = Japx.decode(jsonDecode(response.body));
        var data = jsonEncode(decoded);
        log("data : k ${data}");
        messagelistm = messagelistmFromJson(data);
      } else {
        messageloading.value = false;
        log("Failed to verify OTP: ${response.body}");
        CommonToast(message: "message loading failed");
      }
    } catch (e) {
      log("error in message list : ${e}");
      messageloading.value = false;
    }
  }

  @override
  void onInit() {
    messagelist();
    // TODO: implement onInit
    super.onInit();
  }
}
