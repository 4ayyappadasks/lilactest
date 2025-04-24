import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/common/common_textfield/common_textfield.dart';
import 'package:machinetestlilac/common/commonscaffold/commonScaffold.dart';
import 'package:machinetestlilac/common/text/textdata.dart';
import 'package:machinetestlilac/controller/messagelistscreen/controller.dart';
import 'package:machinetestlilac/core/Baseurl/baseurl.dart';
import 'package:machinetestlilac/core/utils/BorderRadius/borderradius.dart';
import 'package:machinetestlilac/core/utils/Color/Colordata.dart';
import 'package:machinetestlilac/core/utils/Padding/cardinnerpadding.dart';
import 'package:machinetestlilac/core/utils/fontsize/fontsize.dart';
import 'package:machinetestlilac/main.dart';
import 'package:machinetestlilac/view/chatscreen/ui.dart';
import 'package:machinetestlilac/view/splashscreen/ui.dart';

class MeassageScreen extends StatelessWidget {
  const MeassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messagelistscreenCOntroller = Get.put(MessagelistscreenCOntroller());

    return Commonscaffold(
      canPop: false,
      canPopfun: (didPop, result) {
        Navi.to(Splashscreen());
        Get.delete<MessagelistscreenCOntroller>();
      },
      body: SizedBox(
        height: MyApp.height,
        width: MyApp.width,
        child: Column(
          children: [
            SizedBox(height: MyApp.height * 0.1),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {
                    Navi.to(Splashscreen());
                    Get.delete<MessagelistscreenCOntroller>();
                  }, icon: Icon(Icons.arrow_back,color: ColorData.blackcolor,)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Screenpadding.screenpadding),
                    child: Textwithfont(
                      text: "Messages",
                      color: ColorData.blackcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: Fontsize.Fontsizemedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MyApp.height * 0.02),
            SizedBox(
              height: MyApp.height*.12,
              width: MyApp.width*.9,
              child: Obx(() {
                if (messagelistscreenCOntroller.messageloading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (messagelistscreenCOntroller.messagelistm == null ||
                    messagelistscreenCOntroller.messagelistm!.data.isEmpty) {
                  return const Center(
                    child: Text("No user available."),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: messagelistscreenCOntroller.messagelistm!.data.length,
                    itemBuilder: (context, index) {
                      final item = messagelistscreenCOntroller.messagelistm!.data[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: MyApp.height*.04,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage("${item.profilePhotoUrl}"),
                            ),
                            const SizedBox(height: 8),
                            Textwithfont(text:
                              (item.name != null && item.name!.length > 8)
                                  ? "${item.name!.substring(0, 8)}"
                                  : item.name ?? "No Name",
                             fontSize: Fontsize.Fontsizesmall,
                              color: ColorData.blackcolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            SizedBox(height: MyApp.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MyApp.width*.05),
              child: CommonTextField(
                enableborder: Borderradius.buttonborderradius,
                focusborder: Borderradius.buttonborderradius,
                errorborder: Borderradius.buttonborderradius,
                hintText: "Search",
                suffixIcon: Container(height: MyApp.height*.02,width: MyApp.height*.02,child: Padding(
                  padding: EdgeInsets.all(Screenpadding.TextfieldInnersmallpadding),
                  child: Image.asset("images/search-favorite.png"),
                ),),
              ),
            ),
            SizedBox(height: MyApp.height * 0.02),
            Obx(() {
              if (messagelistscreenCOntroller.messageloading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (messagelistscreenCOntroller.messagelistm == null ||
                  messagelistscreenCOntroller.messagelistm!.data.isEmpty) {
                return const Center(
                  child: Text("No user available."),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: MyApp.width*.05),
                    itemCount: messagelistscreenCOntroller.messagelistm!.data.length,
                    itemBuilder: (context, index) {
                      final item = messagelistscreenCOntroller.messagelistm!.data[index];
                      return Padding(
                        padding:  EdgeInsets.symmetric(horizontal: MyApp.width*.002,vertical: MyApp.height*.006),
                        child: ListTile(
                          onTap: () {
                            Get.delete<MessagelistscreenCOntroller>();
                            Navi.to(Chatscreen(name: item.name,img: item.profilePhotoUrl,));
                          },
                          leading:  CircleAvatar(
                            radius: MyApp.height*.04,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(item.profilePhotoUrl),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textwithfont(text:
                              (item.name != null && item.name!.length > 8)
                                  ? "${item.name!.substring(0, 8)}"
                                  : item.name,
                                fontSize: Fontsize.Fontsizemedium,
                                color: ColorData.blackcolor,
                                fontWeight: FontWeight.bold,
                              ),
                              Textwithfont(
                                text: DateFormat.jm().format(item.messageReceivedFromPartnerAt),
                                fontSize: Fontsize.Fontsizesmall,
                                color: ColorData.graycolorbg,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

