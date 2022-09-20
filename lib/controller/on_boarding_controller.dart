import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/utils/routers.dart';
import 'package:http/http.dart' as http;
import 'package:tamine/utils/snackbar.dart';
import 'package:tamine/utils/utils.dart';

enum AccountStatus {
  sentOtp,
  notSentOtp,
  verifyOtp,
  notVerifyOtp,
  verfiError,
  verifyAgo,
  notVerify,
  updateName,
  notUpdateName
}

const steps = [0, 4, 5, 6, 7, 8, 9, 10];

class OnBoardingController extends GetxController {
  final selectLanguage = 0.obs;

  final selectSteps = 0.obs;
  final box = GetStorage();
  TextEditingController phoneController = TextEditingController();
  TextEditingController code1Controller = TextEditingController();
  TextEditingController code2Controller = TextEditingController();
  TextEditingController code3Controller = TextEditingController();
  TextEditingController code4Controller = TextEditingController();
  TextEditingController code5Controller = TextEditingController();
  TextEditingController code6Controller = TextEditingController();
  final nameForm = GlobalKey<FormState>();
  final codeForm = GlobalKey<FormState>();
  final loadingSentOtp = false.obs;
  final loadingVerfiOtp = false.obs;
  final begin = true.obs;
  final otpToken = "".obs;

  requestOtpApi(int phone, BuildContext context) async {
    loadingSentOtp.value = true;

    try {
      var url = Uri.parse(requestOtpUrl);
      var body = {
        "phone": "+964$phone",
      };
      var headers = {'Content-Type': 'application/json'};
      var response =
          await http.post(url, body: json.encode(body), headers: headers);

      loadingSentOtp.value = false;
      // print("api:status code==${response.statusCode}===\n==${response.body}");
      // print(json.encode(body));
      if (response.statusCode == 200) {
        selectSteps.value = 3;
        return AccountStatus.sentOtp;
      } else if (response.statusCode == 400) {
        try {
          var error = json.decode(response.body);
          if (error['error'] == "usedPhone") {
            showSnackbar(context,
                subtitle: "usedPhone", style: SnackbarStyle.error);
            return AccountStatus.notSentOtp;
          }
        } catch (e) {}
        showSnackbar(context, subtitle: "error", style: SnackbarStyle.error);
        return AccountStatus.notSentOtp;
      } else {
        showSnackbar(context, subtitle: "error", style: SnackbarStyle.error);
      }
    } catch (e) {
      showSnackbar(context, subtitle: "error", style: SnackbarStyle.error);
      loadingSentOtp.value = false;
      return AccountStatus.notSentOtp;
    }
  }

  final isCardReaderShow = false.obs;
  getToken() async {
    if (box != null) {
      otpToken.value = box.read("otpToken");
      if (otpToken.value != null && otpToken.value.isNotEmpty) {
        selectSteps.value = steps.indexWhere((element) => element == 7);

        // Future.delayed(const Duration(seconds: 1))
        //     .then((value) => isCardReaderShow.value = true);
      }
    }
  }

  Future<AccountStatus> verfiOtpApi(
      int phone, String code, BuildContext context, Function() onSucess) async {
    loadingVerfiOtp.value = true;
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(verifiOtpUrl);

      var response = await http.post(url,
          body: jsonEncode({"phone": "+964$phone", "code": code}),
          headers: headers);
      loadingVerfiOtp.value = false;
      print("api:verfiOtpApi==error ==${response.statusCode}");
      print("api:verfiOtpApi==error ==${response.body}");
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        otpToken.value = body['otpToken'];
        onSucess();
        box.write("otpToken", otpToken.value);
        return AccountStatus.verifyOtp;
      } else {
        showSnackbar(context,
            subtitle: "verifi_error", style: SnackbarStyle.error);
        return AccountStatus.notVerifyOtp;
      }
    } catch (e) {
      print("api:verfiOtpApi==error ==$e");
      loadingVerfiOtp.value = false;
      showSnackbar(context, subtitle: "error", style: SnackbarStyle.error);
      return AccountStatus.verfiError;
    }
  }
}
