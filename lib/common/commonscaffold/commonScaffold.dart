import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/Color/Colordata.dart';
import '../../main.dart';
import '../text/textdata.dart';
import 'CommonScaffold/CommonScaffoldController.dart';

class Commonscaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final bool canPop;
  final PopInvokedWithResultCallback? canPopfun;
  final String? restorationId;
  final bool useSafeArea;

  Commonscaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.canPop = false,
    this.canPopfun,
    this.restorationId,
    this.useSafeArea = false,
  });

  final connectivityController = Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: canPop,
        onPopInvokedWithResult: canPopfun,
        child: Scaffold(
          appBar: appBar,
          body: connectivityController.isConnected.value
              ? (useSafeArea ? SafeArea(child: body) : body)
              /// if network is not available
              : Container(
            height: MyApp.height,
            width: MyApp.width,
            decoration: BoxDecoration(
              color: ColorData.whitecolor,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/No connection-bro.png"),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: MyApp.height*.04,),
                Container(
                  height: MyApp.height * .1,
                  width: MyApp.height * .1,
                  decoration: BoxDecoration(
                    color: ColorData.whitecolor,
                      // image: const DecorationImage(fit: BoxFit.cover,
                      //     image: AssetImage("images/image1.png"))
                  ),
                ),
                const Spacer(),
                 Textwithfont(text: "No Connection",fontWeight: FontWeight.bold,color: ColorData.cancelbuttoncolor,fontSize: 25,),
                SizedBox(height: MyApp.height*.02,)
              ],
            ),
          ),
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor ?? const Color(0xFFFFFFFF),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        ),
      );
    });
  }
}


