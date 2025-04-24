import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/common/common_textfield/common_textfield.dart';
import 'package:machinetestlilac/common/common_toast/toast.dart';
import 'package:machinetestlilac/common/commonscaffold/commonScaffold.dart';
import 'package:machinetestlilac/common/elevated_button_withgrad/gradientelevated.dart';
import 'package:machinetestlilac/common/elevted_button/ElevatedButton.dart';
import 'package:machinetestlilac/controller/phonenumber/controller.dart';
import 'package:machinetestlilac/core/utils/BorderRadius/borderradius.dart';
import 'package:machinetestlilac/core/utils/Color/Colordata.dart';
import 'package:machinetestlilac/core/utils/Padding/cardinnerpadding.dart';
import 'package:machinetestlilac/main.dart';
import 'package:machinetestlilac/view/splashscreen/ui.dart';

import '../../common/text/textdata.dart';
import '../../core/utils/fontsize/fontsize.dart';

class Phonenumberscreen extends StatelessWidget {
  const Phonenumberscreen({super.key, this.number});

  final int? number;

  @override
  Widget build(BuildContext context) {
    PhonescreenController phonescreenController = Get.put(
        PhonescreenController());
    return Commonscaffold(
      canPopfun: (didPop, result) {
        Navi.to(
            Splashscreen(), transition: Transition.leftToRight);
        Get.delete<PhonescreenController>();
      },
        canPop: false,
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
                      Navi.to(
                          Splashscreen(), transition: Transition.leftToRight);
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
                    text: "Enter your phone number",
                    color: ColorData.blackcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: Fontsize.Fontsizemedium +
                        Fontsize.Fontsizesmallex,
                  )),
            ),
            SizedBox(
              height: MyApp.height * .1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Screenpadding.TextfieldInnerpadding),
              child: Container(
                height: MyApp.height * .07,
                width: MyApp.width * .9,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Borderradius.containerborderradius),
                    border: Border.all(
                        color: ColorData.graycolorbg,
                        width: MyApp.width * .002)),
                padding: EdgeInsets.symmetric(
                    horizontal: Screenpadding.TextfieldInnerpadding),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: ColorData.blackcolor,
                    ),
                    CountryPickerDropdown(
                      dropdownColor: ColorData.whitecolor,
                      icon: Icon(Icons.arrow_drop_down),
                      initialValue: 'IN',
                      itemBuilder: (country) {
                        return Textwithfont(text: "+${country.phoneCode}");
                      },
                      sortComparator: (Country a, Country b) =>
                          a.isoCode.compareTo(b.isoCode),
                      onValuePicked: (Country country) {
                        print("${country.phoneCode}");
                        phonescreenController.countrycode.value =
                            int.parse(country.phoneCode);
                      },
                    ),
                    Expanded(
                      child: CommonTextField(
                        maxLength: 10,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        useUnderlineBorder: true,
                        borderColor: ColorData.whitecolor,
                        onChanged: (p0) {
                          phonescreenController.phonenumber.value =
                              int.parse(p0);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Screenpadding.TextfieldInnerpadding),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Textwithfont(
                    text: "Fliq will send you a text with a verification code.",
                    color: ColorData.blackcolor,
                  )),
            ),
            Spacer(),
            Obx(() =>
            phonescreenController.requestotploading.value
                ? Center(child: CircularProgressIndicator(
              color: ColorData.phonecolor,
            ),)
                : CustomButtonwithgrad(
                width: MyApp.width * .9,
                borderRadius: Borderradius.buttonborderradius,
                text: "Next",
                textcolor: ColorData.whitecolor,
                textsize: Fontsize.Fontsizemedium,
                onTap: () {
                  phonescreenController.phonenumber.value.bitLength > 9
                      ? phonescreenController.requestotp(number:
                      "${phonescreenController.countrycode
                          .value}${phonescreenController.phonenumber.value}")
                  :CommonToast(message: "enter proper mobile number");
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
