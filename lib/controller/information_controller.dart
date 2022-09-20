import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:tamine/model/child_model.dart';
import 'package:tamine/model/location_model.dart';
import 'package:tamine/model/selector_model.dart';
import 'package:tamine/utils/routers.dart';
import 'package:tamine/utils/snackbar.dart';
import 'package:tamine/utils/utils.dart';
import 'package:http/http.dart' as http;

enum Upload { ideal, loading, uploaded, error }

class InformationControler extends GetxController {
  ChildInfoModel? tawminData;
  LocationModel? locationModel;

  final steps = 0.obs;
  final completeSubmit = false.obs;
  final personInfoKey = GlobalKey();
  final childrenInfoKey = GlobalKey();
  final firstPageKey = GlobalKey();
  final locationInfoKey = GlobalKey();
  final locationInfoImageKey = GlobalKey();

  final selectAcademicAchievement = 10.obs;
  final fatherCardImages = GlobalKey();
  final fatherCardImageF = LoadingModel(fatherImKeyF).obs;
  final fatherCardImageB = LoadingModel(fatherImKeyB).obs;

  final frontLocationCardImage = LoadingModel(imLocationKeyF).obs;
  final backLocationCardImage = LoadingModel(imLocationKeyB).obs;

  final childCardImageF = LoadingModel(childImKeyF).obs;
  final childCardImageB = LoadingModel(childImKeyB).obs;

  final fatherFaceImage = LoadingModel(imPerson).obs;

  final fatherDeathImage = LoadingModel("death-father").obs;
  final motherDeathImage = LoadingModel("death-mother").obs;
  final maridImage = LoadingModel("'marriage-doc").obs;
  final deMaridImage = LoadingModel("divorce-doc").obs;
  final husbandDeathImage = LoadingModel("death-partner").obs;
  final custodyDecision = LoadingModel("custody-doc").obs;
  final locationConfirme = LoadingModel('resident-alt').obs;
  final updateChild = false.obs;
  final box = GetStorage();
  final ImagePicker _picker = ImagePicker();

//personal information controllers
  final personalForm = GlobalKey<FormState>();
  TextEditingController fnController = TextEditingController();
  TextEditingController snController = TextEditingController();
  TextEditingController tnController = TextEditingController();
  TextEditingController fonController = TextEditingController();
  TextEditingController lnController = TextEditingController();

  TextEditingController motherFNameController = TextEditingController();
  TextEditingController motherSNameController = TextEditingController();
  TextEditingController motherTNameController = TextEditingController();
  final maritalStatusController = OptionModel(id: 10, title: "", index: 10).obs;
  final maritalStatusChildController =
      OptionModel(id: 10, title: "", index: 10).obs;
  final birthdayController = TextEditingController().obs;
  final studyController =
      OptionModel(id: 10, title: "study_case_1", index: 10).obs;
  final personalCardTypeController =
      OptionModel(id: 11, title: "", index: 10).obs;

  final paterfamiliasWorkTypeController =
      OptionModel(id: 10, title: "", index: 10).obs;
  final workPlaceController = OptionModel(id: 10, title: "", index: 10).obs;

  // final paterfamiliasSalaryController =
  //     OptionModel(id: 10, title: "", index: 10).obs;
  final paterfamiliasSalaryController = TextEditingController().obs;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController workTitleController = TextEditingController();
  TextEditingController newSpaperNumberController = TextEditingController();
  TextEditingController newSpaperNumberChildController =
      TextEditingController();
  TextEditingController recordCardController = TextEditingController();
  TextEditingController cardOffceNameController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController familyNationalNumberController =
      TextEditingController();

  final selectGander1 = 3.obs;
  final isThereLocationCard = 2.obs;
  final childCount = 0.obs;
  final selectGander2 = 3.obs;
  final selectGanderChild = 3.obs;
  final isShowChildForm = false.obs;
  final nationalDate1Controller = TextEditingController().obs;
  final nationalDate1ChildController = TextEditingController().obs;
  // TextEditingController nationalIsuuerController = TextEditingController();
  TextEditingController releaseNameController = TextEditingController();

  // final selectGander = "".obs;

  final locationForm = GlobalKey<FormState>();
  TextEditingController locationNumberController = TextEditingController();

  TextEditingController locationSerialNumberController =
      TextEditingController();
  TextEditingController locationOfficeController = TextEditingController();

  TextEditingController locationStreet1Controller = TextEditingController();
  TextEditingController locationStreet2Controller = TextEditingController();
  TextEditingController locationStreet3Controller = TextEditingController();
  TextEditingController locationDescController = TextEditingController();

  final locationProvinceChooserController =
      OptionModel(id: 10, title: "", index: 10).obs;
  final locationCityChooserController =
      OptionModel(id: 10, title: "", index: 10).obs;

  TextEditingController fnChildController = TextEditingController();
  TextEditingController snChildController = TextEditingController();
  TextEditingController tnChildController = TextEditingController();
  TextEditingController fonChildController = TextEditingController();
  TextEditingController lnChildController = TextEditingController();

  TextEditingController motherNameFChildController = TextEditingController();
  TextEditingController motherNameSChildController = TextEditingController();
  TextEditingController motherNameTChildController = TextEditingController();
  final birthdayChildController = TextEditingController().obs;

  TextEditingController cardNumberChildController = TextEditingController();

  TextEditingController recordCardChildController = TextEditingController();
  TextEditingController cardOffceNameChildController = TextEditingController();
  TextEditingController nationalNumberChildController = TextEditingController();
  TextEditingController familyNationalNumberChildController =
      TextEditingController();

  final childrenForm = GlobalKey<FormState>();
  final childCardTypeController = OptionModel(id: 10, title: "", index: 10).obs;
  final connectionTypeController =
      OptionModel(id: 10, title: "", index: 10).obs;
  final connectionMotherTypeController =
      OptionModel(id: 10, title: "wife", index: 0).obs;
  final childStudyController = OptionModel(id: 10, title: "", index: 10).obs;
  final isShowError = false.obs;
  final childrenListModel = ChildInfoListModel().obs;
  final scrollController = ScrollController().obs;
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
        initialDate: DateTime.now(),
        lastDate: DateTime.now());
    if (picked != null) {
      controller.value.text = picked.toString().split(" ")[0];
    }
  }

  Future<File?> pickFile(BuildContext context, type) async {
    final XFile? photo = await _picker.pickImage(
      source: type == 1 ? ImageSource.gallery : ImageSource.camera,
    );
    if (photo != null) {
      return File(photo.path);
    }
    showSnackbar(context,
        subtitle: "image_picker_error", style: SnackbarStyle.error);
    return null;
  }

  bool ganderValidate(Rx<int> value) {
    var result = value.value < 2 && value.value > -1;
    isShowError.value = !result;

    print("ganderValidate:$result");
    return result;
  }

  Future<bool> uploadImage(
      {required Rx<LoadingModel> loadingModel,
      String? filePath,
      required String token,
      required BuildContext context}) async {
    var headers = {'Authorization': '$token'};

    var request = http.MultipartRequest(
      "POST",
      Uri.parse(addAttachmentUrl),
    );

    request.fields['key'] = loadingModel.value.key;
    request.headers.addAll(headers);

    loadingModel.value.loading.value = Upload.loading;
    if (filePath != null && (await File(filePath).exists())) {
      final minTypeData =
          lookupMimeType(filePath, headerBytes: [0xFF, 0xD8])?.split('/');
      final imuploadRequest = await http.MultipartFile.fromPath(
          'file', filePath,
          contentType: MediaType(minTypeData![0], minTypeData[1]));
      request.files.add(imuploadRequest);
    } else {
      loadingModel.value.loading.value = Upload.error;
      showSnackbar(context,
          subtitle: "error_upload_image", style: SnackbarStyle.error);
    }

    var requ = await request.send();
    var res = await http.Response.fromStream(requ)
        .timeout(const Duration(seconds: 30));
    if (res.statusCode == 200) {
      loadingModel.value.loading.value = Upload.uploaded;
      showSnackbar(context,
          subtitle: "upload_done", style: SnackbarStyle.success);
    } else if (res.statusCode == 401) {
      showSnackbar(context,
          subtitle: "error_unauthorize", style: SnackbarStyle.error);
      loadingModel.value.loading.value = Upload.error;
    } else {
      showSnackbar(context,
          subtitle: "error_upload_image", style: SnackbarStyle.error);
      loadingModel.value.loading.value = Upload.error;
    }

    return true;
  }

  incrementChildCount() {
    if (childCount.value < 21) {
      childCount.value++;
    }
  }

  decrementChildCount() {
    if (childCount.value > 0) {
      childCount.value--;
    }
  }

  saveFatherData(ChildInfoModel data) {
    if (box != null) {
      box.write("father_information", data.toJson());
      tawminData = data;
      print("cach test====save data==1");
      update();
    }
  }

  getFatherData(BuildContext context) {
    if (box != null) {
      try {
        var js = box.read("father_information");

        var data = ChildInfoModel.fromJson(js);

        if (data != null) {
          tawminData = data;

          fnController.text = data.childData!.name1!;
          snController.text = data.childData!.name2!;
          tnController.text = data.childData!.name3!;
          fonController.text = data.childData!.name4!;
          lnController.text = data.childData!.nameLast!;
          motherFNameController.text =
              getMotherName(data.childData!.nameMother!, 0) ?? "";
          motherSNameController.text =
              getMotherName(data.childData!.nameMother!, 1) ?? "";
          motherTNameController.text =
              getMotherName(data.childData!.nameMother!, 2) ?? "";
          birthdayController.value.text = data.childData!.birthday!;
          selectGander1.value = data.childData!.gander!;
          maritalStatusController.value = maritalStatusOptions
              .where((element) => element.id == data.childData!.personalCase)
              .first;

          studyController.value = academicAchievementOptions
              .where((element) => element.id == data.childData!.studyType)
              .first;

          personalCardTypeController.value = cardTypeOptions
              .where((element) => element.id == data.childData!.cardType)
              .first;

          paterfamiliasWorkTypeController.value = workTypeOptions
              .where((element) => element.id == data.childData!.workType)
              .first;
          try {
            workPlaceController.value = workPlaceList
                .where((element) => element.id == data.childData!.workPlace)
                .first;
          } catch (e) {}

          // try {
          //   paterfamiliasSalaryController.value = salaryOption
          //       .where((element) => element.id == data.childData!.salary)
          //       .first;
          // } catch (e) {}
          paterfamiliasSalaryController.value.text =
              data.childData!.salary.toString();
          workTitleController.text = data.childData!.workTitle!;
          nationalNumberController.text =
              data.childData!.cardInfo!.nationalNumber!;
          familyNationalNumberController.text =
              data.childData!.cardInfo!.familyNumber!;
          nationalDate1Controller.value.text =
              data.childData!.cardInfo!.releaseDate!;
          releaseNameController.text = data.childData!.cardInfo!.releaseName!;

          cardNumberController.text =
              data.childData!.cardInfo!.statusIdentificationNumber!;
          newSpaperNumberController.text =
              data.childData!.cardInfo!.newspaperNumber!;

          recordCardController.text = data.childData!.cardInfo!.recordNumber!;
          try {
            cardOffceNameController.text =
                data.childData!.cardInfo!.officeName!;
          } catch (e) {}

          try {
            var fimf = LoadingModel(fatherImKeyF);
            fimf.loading.value = Upload.uploaded;
            fimf.path.value = data.childData!.pathF!;
            fatherCardImageF.value = fimf;
          } catch (e) {
            print("cach test=errr1==${data.childData!.toJson()}");
          }

          try {
            var fimb = LoadingModel(fatherImKeyB);
            fimb.loading.value = Upload.uploaded;
            fimb.path.value = data.childData!.pathB!;
            fatherCardImageB.value = fimb;
          } catch (e) {
            print("cach test=errr2==$e==${data.childData!.pathB!}");
          }

          try {
            var fim = LoadingModel(imPerson);
            fim.loading.value = Upload.uploaded;
            fim.path.value = data.childData!.fatherImage!;

            fatherFaceImage.value = fim;
          } catch (e) {
            print("cach test=errr3==$e");
          }

          try {
            var fatherdeath = LoadingModel(fatherImKeyB);
            fatherdeath.loading.value = Upload.uploaded;
            fatherdeath.path.value =
                data.childData!.extraDataModel!.fatherDath!;
            fatherDeathImage.value = fatherdeath;
          } catch (e) {
            // print("cach test=errr2==$e==${data.childData!.pathB!}");
          }

          if (data.childData!.extraDataModel != null) {
            try {
              childCount.value = data.childData!.extraDataModel!.childNumber!;
            } catch (e) {}
            try {
              var motherdeath = LoadingModel(fatherImKeyB);
              motherdeath.loading.value = Upload.uploaded;
              motherdeath.path.value =
                  data.childData!.extraDataModel!.motherDath!;
              motherDeathImage.value = motherdeath;
            } catch (e) {
              print("cach test=errr2==$e==${data.childData!.pathB!}");
            }
            try {
              var marid = LoadingModel(fatherImKeyB);
              marid.loading.value = Upload.uploaded;
              marid.path.value = data.childData!.extraDataModel!.marid!;
              maridImage.value = marid;
            } catch (e) {
              print("cach test=errr2==$e==${data.childData!.pathB!}");
            }
            try {
              var demarid = LoadingModel(fatherImKeyB);
              demarid.loading.value = Upload.uploaded;
              demarid.path.value = data.childData!.extraDataModel!.disMarid!;
              deMaridImage.value = demarid;
            } catch (e) {
              print("cach test=errr2==$e==${data.childData!.pathB!}");
            }

            try {
              var husbandDeathImage1 = LoadingModel(fatherImKeyB);
              husbandDeathImage1.loading.value = Upload.uploaded;
              husbandDeathImage1.path.value =
                  data.childData!.extraDataModel!.hasbandDath!;
              husbandDeathImage.value = husbandDeathImage1;
            } catch (e) {
              print("cach test=errr2==$e==${data.childData!.pathB!}");
            }
            try {
              var custodyDecision1 = LoadingModel(fatherImKeyB);
              custodyDecision1.loading.value = Upload.uploaded;
              custodyDecision1.path.value =
                  data.childData!.extraDataModel!.childGet!;
              custodyDecision.value = custodyDecision1;
            } catch (e) {
              print("cach test=errr2==$e==${data.childData!.pathB!}");
            }
          }
          // print("cach test=====${data.childData!.birthday}");
          update();
        }
      } catch (e) {}
    }
  }

  saveLocationrData(LocationModel data) {
    if (box != null) {
      box.write("location_information", data.toJson());
      locationModel = data;

      update();
    }
  }

  getLocationData(BuildContext context) {
    if (box != null) {
      try {
        var data = LocationModel.fromJson(box.read("location_information"));
        if (data != null) {
          locationModel = data;

          try {
            isThereLocationCard.value = data.isLocationCard!;
            locationNumberController.text = data.number!;

            try {
              locationSerialNumberController.text = data.serialNumber!;
            } catch (e) {}
            try {
              locationProvinceChooserController.value =
                  OptionModel(id: 0, title: "Baghdad", index: 0);
            } catch (e) {}
            try {
              locationCityChooserController.value =
                  OptionModel(id: 0, title: "badra", index: 0);
            } catch (e) {}

            locationDescController.text = data.description!;
            try {
              locationStreet1Controller.text = data.l1!;
            } catch (e) {}

            try {
              locationStreet2Controller.text = data.l2!;
            } catch (e) {}

            try {
              locationStreet3Controller.text = data.l3!;
            } catch (e) {}
            try {
              locationOfficeController.text = data.locationOffice!;
            } catch (e) {}

            try {
              var locationConfirme1 = LoadingModel('resident-alt');
              locationConfirme1.loading.value = Upload.uploaded;
              locationConfirme1.path.value = data.image!;
              locationConfirme.value = locationConfirme1;
            } catch (e) {
              // print("cach test=errr1");
            }

            try {
              var frontLocationCardImage1 = LoadingModel(imLocationKeyF);
              frontLocationCardImage1.loading.value = Upload.uploaded;
              frontLocationCardImage1.path.value = data.cardfimage!;
              frontLocationCardImage.value = frontLocationCardImage1;
            } catch (e) {
              // print("cach test=errr2==${data.cardfimage}");
            }

            try {
              var backLocationCardImage1 = LoadingModel(imLocationKeyB);
              backLocationCardImage1.loading.value = Upload.uploaded;
              backLocationCardImage1.path.value = data.cardbimage!;
              backLocationCardImage.value = backLocationCardImage1;
            } catch (e) {
              // print("cach test=errr3===${data.cardbimage}");
            }
          } catch (e) {}

          update();
        }
      } catch (e) {}
    }
  }

  saveChildrenListData() {
    if (box != null) {
      // childrenListModel.value.childildren!.add(data);
      var list = {
        "childrenListModel": childrenListModel.value.childildren.value
            .map((e) => e.toJson())
            .toList()
      };
      box.write("children_information", list);

      update();
    }
  }

  getChildrenData(BuildContext context) {
    if (box != null) {
      try {
        var data = box.read("children_information") as Map<dynamic, dynamic>;

        List<Map<dynamic, dynamic>> list =
            (data['childrenListModel'] as List<dynamic>)
                .map((e) => e as Map<dynamic, dynamic>)
                .toList();
        print("982948==11 ==length==${list}");
        childrenListModel.value.childildren.value =
            list.map((e) => ChildInfoModel.fromJson(e)).toList();

        update();
      } catch (_) {}
    }

    try {
      var data = LocationModel.fromJson(box.read("children_information"));
      if (data != null) {
        locationModel = data;
        update();
      }
    } catch (e) {}
  }
}

class LoadingModel {
  String key;
  final loading = Upload.ideal.obs;
  final path = "".obs;
  LoadingModel(
    this.key,
  );
}
