import 'package:easy_localization/easy_localization.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:flutter/material.dart';

enum Validator { required, email, phone, textOnly, number, familyNumber }

extension TextValidate on Validator {
  String hint({String? a}) {
    var msg = "";
    switch (this) {
      case Validator.required:
        msg = a ?? "is_required".tr();
        break;
      case Validator.phone:
        msg = a ?? "phone_validate".tr();
        break;
      case Validator.email:
        msg = a ?? "email_validator".tr();
        break;
      case Validator.textOnly:
        msg = a ?? "text_validator".tr();
        break;
      case Validator.number:
        msg = a ?? "number_validator".tr();
        break;
      case Validator.familyNumber:
        msg = a ?? "card_national_family_validator".tr();
        break;
    }
    return msg;
  }

  bool isRequired(String? a) {
    if (a == null || a.isEmpty || a.replaceAll(" ", "").isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool isPhone(String? a) {
    if (!isPhoneRegex(a!) ||
        (a.length > 11 || a.length < 10) ||
        (a.length == 11 && a[0] != "0") ||
        (a.length == 10 && a[0] == "0") ||
        (a.length == 11 && a[1] != "7") ||
        (a.length == 10 && a[0] != "7")) {
      return false;
    } else {
      return true;
    }
  }

  bool isPhoneRegex(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    return regExp.hasMatch(value);
  }

  bool isNumebr(String value) {
    String patttern = r'^[0-9]+$';
    RegExp regExp = RegExp(patttern);
    return regExp.hasMatch(value);
  }

  bool isValidEmail(String a) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(a);
  }

  bool isTextOnly(String a) {
    return RegExp(r'^([a-z]||[A-Z]||[ ء-ي])+$').hasMatch(a.replaceAll(" ", ""));
  }

  bool isFamilyNumber(String a) {
    return RegExp(r'^(?=.*?\d)(?=.*?[A-Z])[A-Z\d]+$').hasMatch(a) &&
        a.length > 15;
  }
}

Future<OverlayEntry> showOverlay(BuildContext context, ValueNotifier<bool> show,
    {required String text}) async {
  var renderbox = context.findRenderObject() as RenderBox;
  var offset = renderbox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    return Material(
      child: Positioned(
          left: offset.dx,
          top: offset.dy,
          child: Wrap(
            children: [
              Container(
                width: 100,
                height: 70,
                // decoration: ShapeDecoration(
                //     color: Colors.red, shape: ToolTipCustomShape()),
                child: Text("jfji"),
              ),
            ],
          )),
    );
  });

  return overlayEntry;
}
