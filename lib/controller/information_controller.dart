import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamine/utils/snackbar.dart';
import 'package:tamine/utils/utils.dart';

class InformationControler extends GetxController {
  final steps = 0.obs;
  final personInfoKey = GlobalKey();
  final childrenInfoKey = GlobalKey();
  final locationInfoKey = GlobalKey();
  final selectKey = GlobalKey().obs;
  final pageController = PageController();
  final studyType = "".obs;
  final fatherCardImages = GlobalKey();
  final frontCardImage = "".obs;
  final backCardImage = "".obs;

  final frontLocationCardImage = "".obs;
  final backLocationCardImage = "".obs;

  final frontChildCardImage = "".obs;
  final backChildCardImage = "".obs;
  final frontChildImage = "".obs;

  final fatherFaceImage = "".obs;

  final ImagePicker _picker = ImagePicker();
  TextEditingController phoneController = TextEditingController();
  TextEditingController code1Controller = TextEditingController();
  TextEditingController code2Controller = TextEditingController();
  TextEditingController code3Controller = TextEditingController();
  TextEditingController code4Controller = TextEditingController();
  TextEditingController code5Controller = TextEditingController();
  TextEditingController code6Controller = TextEditingController();

//personal information controllers
  final personalForm = GlobalKey<FormState>();
  TextEditingController fnController = TextEditingController();
  TextEditingController snController = TextEditingController();
  TextEditingController tnController = TextEditingController();
  TextEditingController fonController = TextEditingController();
  TextEditingController lnController = TextEditingController();

  TextEditingController motherNameController = TextEditingController();
  final maritalStatusController = TextEditingController().obs;
  final birthdayController = TextEditingController().obs;
  final studyController = TextEditingController().obs;
  final personalCardTypeController = TextEditingController().obs;

  TextEditingController cardTypeController = TextEditingController();
  TextEditingController cardImageFController = TextEditingController();
  TextEditingController cardImageBController = TextEditingController();
  TextEditingController fatherImageController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardInformationNumberController =
      TextEditingController();
  TextEditingController recordCardController = TextEditingController();
  TextEditingController cardOffceNumberController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController familyNationalNumberController =
      TextEditingController();

  final gander1Controller = "".obs;
  final gander2Controller = "".obs;
  final childGanderController = "".obs;
  final nationalDate1Controller = TextEditingController().obs;
  TextEditingController nationalIsuuerController = TextEditingController();

  // final selectGander = "".obs;

  final locationForm = GlobalKey<FormState>();
  TextEditingController locationNumberController = TextEditingController();

  TextEditingController locationSerialNumberController =
      TextEditingController();
  TextEditingController locationOfficeController = TextEditingController();
  TextEditingController locationProvinceController = TextEditingController();
  TextEditingController locationCityController = TextEditingController();
  TextEditingController locationStreet1Controller = TextEditingController();
  TextEditingController locationStreet2Controller = TextEditingController();
  TextEditingController locationStreet3Controller = TextEditingController();
  TextEditingController locationDescController = TextEditingController();

  final locationProvinceChooserController = TextEditingController().obs;
  final locationCityChooserController = TextEditingController().obs;

  TextEditingController fnChildController = TextEditingController();
  TextEditingController snChildController = TextEditingController();
  TextEditingController tnChildController = TextEditingController();
  TextEditingController fonChildController = TextEditingController();
  TextEditingController lnChildController = TextEditingController();

  TextEditingController motherNameChildController = TextEditingController();
  final birthdayChildController = TextEditingController().obs;

  TextEditingController cardTypeChildController = TextEditingController();
  TextEditingController cardImageChildFController = TextEditingController();
  TextEditingController cardImageChildBController = TextEditingController();

  TextEditingController cardNumberChildController = TextEditingController();
  TextEditingController cardInformationNumberChildController =
      TextEditingController();
  final maritalStatusChildController = TextEditingController().obs;
  TextEditingController recordCardChildController = TextEditingController();
  TextEditingController cardOffceNumberChildController =
      TextEditingController();
  TextEditingController nationalNumberChildController = TextEditingController();
  TextEditingController familyNationalNumberChildController =
      TextEditingController();

  final childrenForm = GlobalKey<FormState>();

  final childMaritalStatusController = TextEditingController().obs;
  final childStudyController = TextEditingController().obs;
  final isAddChildrenShow = false.obs;
  Future<void> selectDate(
      BuildContext context, Rx<TextEditingController> controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                dialogTheme: DialogTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                ),
                colorScheme: const ColorScheme.light(
                  primary: kPrimary, // header background color
                  onPrimary: Colors.black, // header text color
                  onSurface: Colors.black87, // body text color
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  child: child!));
        },
        firstDate: DateTime(1920),
        initialDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null) {
      controller.value.text = picked.toString().split(" ")[0];
    }
  }

  Future<File?> pickFile(BuildContext context) async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (photo != null) {
      return File(photo.path);
    }
    showSnackbar(context,
        subtitle: "image_picker_error", style: SnackbarStyle.error);
    return null;
  }

  bool ganderValidate(Rx<String> value) {
    var result = value.value.isNotEmpty;
    isAddChildrenShow.value = !result;

    print("ganderValidate:$result");
    return result;
  }
}
