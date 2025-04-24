import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/common/commonscaffold/commonScaffold.dart';
import 'package:machinetestlilac/common/elevated_button_withgrad/gradientelevated.dart';
import 'package:machinetestlilac/controller/phonenumber/controller.dart';
import 'package:machinetestlilac/core/utils/BorderRadius/borderradius.dart';
import 'package:machinetestlilac/core/utils/Color/Colordata.dart';
import 'package:machinetestlilac/core/utils/Padding/cardinnerpadding.dart';
import 'package:machinetestlilac/main.dart';
import '../../common/text/textdata.dart';
import '../../controller/otpscreen/controller.dart';
import '../../core/utils/fontsize/fontsize.dart';
import '../phonenumberscreen/ui.dart';

class otpscreen extends StatelessWidget {
  const otpscreen({super.key , required this.number});

  final String number;
  @override
  Widget build(BuildContext context) {
    Otpscreencontroller otpscreencontroller = Get.put(Otpscreencontroller());
    return Commonscaffold(
      canPop: false,
        canPopfun: (didPop, result) {
          Navi.to(Phonenumberscreen(), transition: Transition.leftToRight);
          Get.delete<PhonescreenController>();
        },
        body: Column(
          children: [
            SizedBox(
              height: MyApp.height * .1,
            ),
            Row(
              children: [
                SizedBox(
                  width: MyApp.width * .05,
                ),
                IconButton(
                    onPressed: () {
                      Navi.to(Phonenumberscreen(), transition: Transition.leftToRight);
                      Get.delete<PhonescreenController>();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorData.blackcolor,
                    )),
              ],
            ),
            SizedBox(
              width: MyApp.width * .8,
              height: MyApp.height * .15,
              child: Center(
                  child: Textwithfont(
                    textAlign: TextAlign.center,
                    maxliness: 2,
                    textoverflow: TextOverflow.ellipsis,
                    text: "Enter your verification code",
                    color: ColorData.blackcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: Fontsize.Fontsizemedium + Fontsize.Fontsizesmallex,
                  )),
            ),
            SizedBox(
              height: MyApp.height * .05,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Screenpadding.TextfieldInnerpadding),
                child: GestureDetector(
                  onTap: () {
                    Navi.to(Phonenumberscreen(), transition: Transition.leftToRight);
                    Get.delete<PhonescreenController>();
                  },
                  child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "+$number",
                            style: GoogleFonts.karla(
                              fontSize: Fontsize.Fontsizesmall,
                              color: ColorData.blackcolor,
                            )),
                        TextSpan(
                            text: " . Edit",
                            style: GoogleFonts.karla(
                              fontSize: Fontsize.Fontsizemedium,
                              fontWeight: FontWeight.bold,
                              color: ColorData.blackcolor,
                            )),
                      ])),
                ),
              ),
            ),
            SizedBox(
              height: MyApp.height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Screenpadding.TextfieldInnerpadding),
              child:OtpTextField(
                autoFocus: true,
                fieldWidth: MyApp.width*.12,
                fieldHeight: MyApp.width*.12,
                borderRadius: BorderRadius.circular(Borderradius.containerborderradius),
                clearText: true,
                keyboardType: TextInputType.number,
                numberOfFields: 6,
                borderColor: ColorData.graycolorbg,
                cursorColor: ColorData.blackcolor,
                enabledBorderColor: ColorData.graycolorbg,
                focusedBorderColor: ColorData.blackcolor,
                disabledBorderColor: ColorData.graycolorbg,
                showFieldAsBox: true,
                onSubmit: (String verificationCode) {
                  otpscreencontroller.otp.value = verificationCode;
                },
              ),
            ),
            SizedBox(height: MyApp.height*.02,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Screenpadding.TextfieldInnerpadding),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Didn’t get anything? No worries, let’s try again.",
                        style: GoogleFonts.karla(
                          fontSize: Fontsize.Fontsizesmall,
                          color: ColorData.blackcolor,
                        )),
                    TextSpan(
                        text: "Resent",
                        style: GoogleFonts.karla(
                          fontSize: Fontsize.Fontsizemedium,
                          fontWeight: FontWeight.bold,
                          color: ColorData.bluecolor,
                        )),
                  ])),
            ),
            Spacer(),
            Obx(() =>otpscreencontroller.otploading.value
                ?Center(child: CircularProgressIndicator(
              color: ColorData.phonecolor,
            ),)
                :CustomButtonwithgrad(
                width: MyApp.width*.9,
                borderRadius: Borderradius.buttonborderradius,
                text: "Verify",
                textcolor: ColorData.whitecolor,
                textsize: Fontsize.Fontsizemedium,
                onTap: () {
                  otpscreencontroller.verifyotp(otp: otpscreencontroller.otp.value, number: number);
                },
                gradalingend: Alignment.centerLeft,
                gradalingbegin: Alignment.centerRight,
                gradientColors: [
                  ColorData.elevatedbuttongradd,
                  ColorData.elevatedbuttongradd,
                  ColorData.elevatedbuttongradl,
                ]),),
            SizedBox(
              height: MyApp.height * .02,
            ),
          ],
        ));
  }
}
