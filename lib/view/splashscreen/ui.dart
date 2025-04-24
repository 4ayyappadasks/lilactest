import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machinetestlilac/common/Navigation/navigation.dart';
import 'package:machinetestlilac/common/commonscaffold/commonScaffold.dart';
import 'package:machinetestlilac/common/elevted_button/ElevatedButton.dart';
import 'package:machinetestlilac/common/text/textdata.dart';
import 'package:machinetestlilac/core/utils/BorderRadius/borderradius.dart';
import 'package:machinetestlilac/core/utils/Color/Colordata.dart';
import 'package:machinetestlilac/core/utils/fontsize/fontsize.dart';
import 'package:machinetestlilac/main.dart';
import 'package:machinetestlilac/view/phonenumberscreen/ui.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Commonscaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MyApp.width,
        height: MyApp.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/coverimg.png"))),
        child: Column(
          children: [
            SizedBox(
              height: MyApp.height * .1,
            ),
            Container(
              height: MyApp.height * .05,
              width: MyApp.height * .05,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/LOGO.png"))),
            ),
            SizedBox(
              height: MyApp.height * .005,
            ),
            SizedBox(
              width: MyApp.width * .8,
              height: MyApp.height * .15,
              child: Center(
                  child: Textwithfont(
                textAlign: TextAlign.center,
                maxliness: 2,
                textoverflow: TextOverflow.ellipsis,
                text: "Connect. Meet. Love. With Fliq Dating",
                color: ColorData.whitecolor,
                fontWeight: FontWeight.bold,
                fontSize: Fontsize.Fontsizemedium + Fontsize.Fontsizesmallex,
              )),
            ),
            Spacer(),
            CommonMaterialButton(
              width: MyApp.width * .9,
              height: MyApp.height * .07,
              borderRadius:
                  BorderRadius.circular(Borderradius.buttonborderradius),
              onPressed: () {},
              color: ColorData.whitecolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/Google.png",
                    height: MyApp.height * .03,
                  ),
                  SizedBox(
                    width: MyApp.width * .02,
                  ),
                  Textwithfont(
                    text: "Sign in with Google",
                    color: ColorData.blackcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyApp.height * .02,
            ),
            CommonMaterialButton(
              width: MyApp.width * .9,
              height: MyApp.height * .07,
              borderRadius:
                  BorderRadius.circular(Borderradius.buttonborderradius),
              onPressed: () {},
              color: ColorData.fbcolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/fb.png",
                    height: MyApp.height * .03,
                  ),
                  SizedBox(
                    width: MyApp.width * .02,
                  ),
                  Textwithfont(
                    text: "Sign in with Facebook",
                    fontWeight: FontWeight.bold,
                    color: ColorData.whitecolor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyApp.height * .02,
            ),
            CommonMaterialButton(
              width: MyApp.width * .9,
              height: MyApp.height * .07,
              borderRadius:
                  BorderRadius.circular(Borderradius.buttonborderradius),
              onPressed: () {
                Navi.to(Phonenumberscreen());
              },
              color: ColorData.phonecolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/Phone.png",
                    height: MyApp.height * .03,
                  ),
                  SizedBox(
                    width: MyApp.width * .02,
                  ),
                  Textwithfont(
                    text: "Sign in with phone number",
                    color: ColorData.whitecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyApp.height * .02,
            ),
            SizedBox(
              width: MyApp.width * .9,
              child: RichText(
                textAlign: TextAlign.center,
                  text: TextSpan(children: [
                TextSpan(
                    text: "By signing up, you agree to our ",
                    style: GoogleFonts.karla(
                      fontSize: Fontsize.Fontsizemedium,
                      color: ColorData.whitecolor,
                    )),
                TextSpan(
                    text: " Terms  ",
                    style: GoogleFonts.karla(
                      fontSize: Fontsize.Fontsizemedium,
                      fontWeight: FontWeight.bold,
                      color: ColorData.whitecolor,
                    )),
                TextSpan(
                    text: " See how we use your data in our  ",
                    style: GoogleFonts.karla(
                      fontSize: Fontsize.Fontsizemedium,
                      color: ColorData.whitecolor,
                    )),
                TextSpan(
                    text: "Privacy Policy.",
                    style: GoogleFonts.karla(
                      fontSize: Fontsize.Fontsizemedium,
                      fontWeight: FontWeight.bold,
                      color: ColorData.whitecolor,
                    )),
              ])),
            ),
            SizedBox(
              height: MyApp.height * .03,
            ),
          ],
        ),
      ),
    ));
  }
}
