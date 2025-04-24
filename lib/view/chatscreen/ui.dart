import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/common/common_textfield/common_textfield.dart';
import 'package:machinetestlilac/common/commonscaffold/commonScaffold.dart';
import 'package:machinetestlilac/common/text/textdata.dart';
import 'package:machinetestlilac/controller/chatscreen/controller.dart';
import 'package:machinetestlilac/core/utils/BorderRadius/borderradius.dart';
import 'package:machinetestlilac/core/utils/Color/Colordata.dart';
import 'package:machinetestlilac/core/utils/Padding/cardinnerpadding.dart';
import 'package:machinetestlilac/core/utils/fontsize/fontsize.dart';
import 'package:machinetestlilac/main.dart';
import 'package:machinetestlilac/view/messagescreen/ui.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({
    super.key,
    required this.name,
    required this.img,
  });

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    ChnatscreenController chnatscreenController = Get.put(ChnatscreenController());
    // chnatscreenController.loadchat(id: id);
    return Commonscaffold(
      canPopfun: (didPop, result) {
        Navi.to(MeassageScreen(),
            transition: Transition.leftToRight);
        Get.delete<ChnatscreenController>();
      },
        canPop: false,
        backgroundColor: ColorData.graycolorbglite,
        body: Obx(() =>
        chnatscreenController.chatloading.value
            ?Center(child: CircularProgressIndicator(
          color: ColorData.phonecolor,
        ),)
            :Column(
          children: [
            SizedBox(height: MyApp.height * 0.08),
            Row(
              children: [
                SizedBox(
                  width: MyApp.width * .05,
                ),
                IconButton(
                    onPressed: () {
                      Navi.to(MeassageScreen(),
                          transition: Transition.leftToRight);
                      Get.delete<ChnatscreenController>();
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                          color: ColorData.whitecolor, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorData.blackcolor,
                      ),
                    )),
                SizedBox(
                  width: MyApp.width * .02,
                ),
                CircleAvatar(
                  radius: MyApp.height * .03,
                  backgroundColor: ColorData.whitecolor,
                  backgroundImage: NetworkImage(img),
                ),
                SizedBox(
                  width: MyApp.width * .01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Textwithfont(
                      text: name,
                      color: ColorData.blackcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: Fontsize.Fontsizemedium,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Textwithfont(text: "Online"),
                        Icon(Icons.circle,color: ColorData.online,size: Fontsize.Fontsizesmall,)
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MyApp.height * 0.03),
            Expanded(
              child: Container(
                width: MyApp.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorData.blackcolor,
                      offset: Offset(0, 8),
                      blurRadius: MyApp.height * .02,
                    )
                  ],
                  color: ColorData.whitecolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Borderradius.containerborderradius),
                    topRight: Radius.circular(Borderradius.containerborderradius),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: chnatscreenController.userchat?.data.length??0,
                          itemBuilder: (context, index) {
                            final chat = chnatscreenController.userchat!.data[index];
                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Card(
                                    color: ColorData.whitecolor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(Borderradius.buttonborderradius)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MyApp.width * .02,
                                          vertical: MyApp.height * .001),
                                      child: Textwithfont(
                                        fontSize: Fontsize.Fontsizesmallex,
                                        text: chnatscreenController.formatDate(chat.deliveredAt),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:chat.sender.type.name=="SENDER"
                                  ?Alignment.centerRight
                                  :Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MyApp.width * .05, vertical: MyApp.height * .005),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: MyApp.width * 0.7,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: MyApp.width * .03,
                                        vertical: MyApp.height * .01,
                                      ),
                                      decoration: BoxDecoration(
                                        color:chat.sender.type.name=="SENDER"
                                        ?ColorData.phonecolor
                                        :ColorData.graycolorbglite,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(Borderradius.containerborderradius),
                                          topRight: Radius.circular(Borderradius.containerborderradius),
                                          topLeft: Radius.circular(Borderradius.containerborderradius),
                                        ),
                                      ),
                                      child: Textwithfont(
                                        fontWeight: FontWeight.w700,
                                        color: ColorData.whitecolor,
                                        maxliness: null,
                                        text: chat.message ?? "no messages",
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MyApp.width * .02,
                                        vertical: MyApp.height * .001),
                                    child: Textwithfont(
                                      fontSize: Fontsize.Fontsizesmallex,
                                      text: chnatscreenController.formattime(
                                          chnatscreenController.userchat?.data[index].deliveredAt),
                                    )
                                  ),
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MyApp.width * .08),
                      child: CommonTextField(
                        suffixIcon: Container(
                          height: MyApp.height * .02,
                          width: MyApp.height * .02,
                          child: Padding(
                            padding: EdgeInsets.all(Screenpadding.TextfieldInnersmallpadding),
                            child: Image.asset("images/send.png"),
                          ),
                        ),
                        hintText: "Message",
                        fillcolor: ColorData.graycolorbg.withOpacity(.5),
                        errorborder: Borderradius.buttonborderradius,
                        focusborder: Borderradius.buttonborderradius,
                        enableborder: Borderradius.buttonborderradius,
                      ),
                    ),
                    SizedBox(height: MyApp.height * 0.01),
                  ],
                ),
              ),
            )
          ],
        ),));
  }
}
