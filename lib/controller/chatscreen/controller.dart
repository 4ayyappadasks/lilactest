import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:japx/japx.dart';
import 'package:machinetestlilac/core/Baseurl/baseurl.dart';
import 'package:machinetestlilac/model/userchat.dart';

class ChnatscreenController extends GetxController{
  final box = GetStorage();
  var chatloading = false.obs;
  // loadchat({required String id})async{
  Userchat? userchat;
  loadchat()async{
    try{
      // var userid = box.read('userchatid');
      chatloading.value= true;
      // print("userid : $userid , chat id : $id");
      // var response = await http.get(Uri.parse("$BASEURL/chat/chat-messages/queries/chat-between-users/${userid}/$id"),
      var response = await http.get(Uri.parse("$BASEURL/chat/chat-messages/queries/chat-between-users/55/81"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('accessToken')}',
        },);
      // log("response :::: ${response.body}");
      if(response.statusCode==200)
        {
          chatloading.value= false;
          final chatdecod = Japx.decode(jsonDecode(response.body));
          var data = jsonEncode(chatdecod);
          log("userchat ${data}");
          userchat = userchatFromJson(data);
        }
      else
        {
          chatloading.value= false;
        }
    }
        catch(e){
      chatloading.value= false;
        }
  }
  String formatDate(DateTime? date) {
    if (date == null) return '';

    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return 'Today';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
  String formattime(DateTime? date) {
    if (date == null) return '';
    String time = DateFormat('hh:mm a').format(date);
      return '$time';
  }



  @override
  void onInit() {
    loadchat();
    super.onInit();
  }
}