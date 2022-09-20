import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as M;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:tamine/controller/on_boarding_controller.dart';

import 'package:tamine/services/validation.dart';

import 'package:tamine/utils/utils.dart';
import 'package:tamine/widgets/fd_button.dart';
import 'package:tamine/widgets/fd_text_input.dart';
import 'package:tamine/widgets/otp_input.dart';

class OnBordingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final theme = Theme.of(context);
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      //appBar: AppBar(title: Text(query.viewInsets.bottom.toString())),
      body: SafeArea(
        child: controller.initialized
            ? Obx(
                () => Stack(
                  children: [
                    Container(
                      height: query.size.height,
                      width: query.size.width,
                      color: theme.scaffoldBackgroundColor,
                      child: const Text("  "),
                    ),
                    PhoneInterView(
                        impath: "assets/images/onboarding4.png", query: query),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                          padding: const EdgeInsets.only(
                              left: kDefaultPadding, right: kDefaultPadding),
                          duration:
                              const Duration(milliseconds: kDefaultDuration),
                          height: steps[controller.selectSteps.value] > 6
                              ? 0
                              : steps[controller.selectSteps.value] == 0
                                  ? query.size.height * 0.353
                                  : query.size.height /
                                      (steps[controller.selectSteps.value] == 0
                                          ? 2.81333
                                          : steps[controller
                                                      .selectSteps.value] ==
                                                  4
                                              ? 1
                                              : steps[controller
                                                          .selectSteps.value] ==
                                                      5
                                                  ? 2.9
                                                  : steps[controller.selectSteps
                                                              .value] ==
                                                          6
                                                      ? 1.8
                                                      : 2.6375),
                          width: query.size.width,
                          decoration: BoxDecoration(
                            color: theme.appBarTheme.backgroundColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                          ),
                          child: Stack(
                            children: [
                              TextView(query: query.size, theme: theme),
                              TextView4(query: query.size, theme: theme),
                              const TextViewPhone()
                            ],
                          )),
                    ),
                    //   const IndicatorView(),
                    const ImageViewFirst(),
                    // const ImageView(
                    //   currentStep: 1,
                    //   impath: "assets/images/onboarding1.png",
                    // ),
                    // const ImageViewThird(),
                    // const ImageView(
                    //   currentStep: 3,
                    //   impath: "assets/images/onboarding3.png",
                    // ),
                    // const ButtonView(),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

class TextView4 extends GetView<OnBoardingController> {
  const TextView4({
    Key? key,
    required this.query,
    required this.theme,
  }) : super(key: key);

  final Size query;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSlide(
        offset: steps[controller.selectSteps.value] < 4
            ? const Offset(0, 0.3)
            : steps[controller.selectSteps.value] > 4
                ? const Offset(0, 0.2)
                : const Offset(0, 0),
        duration: const Duration(milliseconds: kDefaultDuration),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: kDefaultDuration),
          opacity: steps[controller.selectSteps.value] == 4 ? 1 : 0,
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding),
              ListTile(
                contentPadding: const EdgeInsets.all(kDefaultPadding),
                title: Text(
                  "title5".tr(),
                  style: theme.textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: AnimatedContainer(
                  duration: const Duration(milliseconds: kDefaultDuration),
                  margin: const EdgeInsets.only(top: kDefaultPadding * 2),
                  // height: steps[controller.selectSteps.value] == 4 ? query.height / 2 : 10,
                  height: query.height / 2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "سوف يتم التأكد من رقم هاتفك, فتأكد من ان رقم هاتفك يعمل بشكل صحيح ولا تقدم اكثر من مرة.",
                        "استعد قبل البدء بعملية التقديم, ستحتاج الى الوثائق الشخصية الثبوتية الخاصة بك اثناء عملية التقديم.",
                        "تأكد من ادخال معلوماتك الصحيحة وفي حالة استخدامك لمعلومات وهمية او لمعلومات شخص اخر او اخفاء اية معلومات مطلوبة فستعرض نفسك الى المحاسبة القانونية والعقوبات القضائية.",
                        "يقوم الموقع بحفظ كافة المعلومات المدخلة لتتم مراجعتها لاحقا وتدقيقها مع الجهات الحكومية.",
                        "ان قيامك بعملية التقديم يعني تعهدك بقراءة وفهم هذه التعليمات وموافقتك على الشروط والاحكام المتعلقة."
                      ]
                          .map(
                            (e) => ListTile(
                              leading: const SizedBox(
                                width: 10,
                                child: Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                              ),
                              horizontalTitleGap: 0,
                              title: Text(
                                e,
                                style: theme.textTheme.bodySmall,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageViewFirst extends GetView<OnBoardingController> {
  const ImageViewFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Obx(
      () => AnimatedSlide(
        duration: const Duration(milliseconds: kDefaultDuration),
        offset: steps[controller.selectSteps.value] == 0
            ? Offset(0, 0)
            : Offset(1, 0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: (query.size.height * 0.5864) -
                    20 -
                    query.viewInsets.top -
                    kDefaultPadding * 2 -
                    query.size.height / 15,
                width: query.size.width,
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: kDefaultDuration),
                  offset: steps[controller.selectSteps.value] == 0
                      ? const Offset(0, 0)
                      : const Offset(1, 0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      "assets/images/onboarding.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const LanguageChooserView(
                step: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageView extends GetView<OnBoardingController> {
  const ImageView({Key? key, required this.currentStep, required this.impath})
      : super(key: key);

  final int currentStep;
  final String impath;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Obx(
      () => Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: query.height / 1.6,
          width: query.width - 64,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: kDefaultDuration),
            offset: steps[controller.selectSteps.value] == currentStep
                ? const Offset(0, 0)
                : steps[controller.selectSteps.value] < currentStep
                    ? const Offset(-1.5, 0)
                    : steps[controller.selectSteps.value] == 4 &&
                            currentStep == 3
                        ? const Offset(0, -1.2)
                        : currentStep == 3
                            ? const Offset(0, -1.2)
                            : const Offset(1.5, 0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: kDefaultDuration),
              opacity:
                  currentStep == 3 && steps[controller.selectSteps.value] > 3
                      ? 0
                      : 1,
              child: Image.asset(
                impath,
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageViewThird extends GetView<OnBoardingController> {
  const ImageViewThird({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Obx(
      () => Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: query.height / 1.6,
          width: query.width - 64,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: kDefaultDuration),
            offset: steps[controller.selectSteps.value] == 2
                ? const Offset(0, 0)
                : steps[controller.selectSteps.value] < 2
                    ? const Offset(-1, 0)
                    : const Offset(1.5, 0),
            child: Container(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                "assets/images/onboarding2.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageChooserView extends GetView<OnBoardingController> {
  const LanguageChooserView({Key? key, required this.step}) : super(key: key);
  final int step;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Obx(
      () => AnimatedSlide(
        duration: const Duration(milliseconds: kDefaultDuration),
        offset: steps[controller.selectSteps.value] == step
            ? const Offset(0, 0)
            : steps[controller.selectSteps.value] > step
                ? const Offset(1.5, 0)
                : steps[controller.selectSteps.value] < step
                    ? const Offset(-1.5, 0)
                    : const Offset(1, 0),
        child: Container(
          height: query.height / 15,
          margin:
              const EdgeInsets.only(top: kDefaultPadding, left: 28, right: 28),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Row(
            children: [
              Expanded(
                child: FDButton(
                  title: "العربية",
                  textStyle: theme.textTheme.bodyMedium,
                  padding: const EdgeInsets.all(7),
                  borderColor: Colors.transparent,
                  backgroundColor: controller.selectLanguage.value == 0
                      ? theme.scaffoldBackgroundColor
                      : Colors.transparent,
                  onPressed: () => controller.selectLanguage.value = 0,
                ),
              ),
              Expanded(
                child: FDButton(
                  title: "كوردى",
                  textStyle: theme.textTheme.bodyMedium,
                  padding: const EdgeInsets.all(7),
                  borderColor: Colors.transparent,
                  backgroundColor: controller.selectLanguage.value == 1
                      ? theme.scaffoldBackgroundColor
                      : Colors.transparent,
                  onPressed: () => controller.selectLanguage.value = 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorView extends GetView<OnBoardingController> {
  const IndicatorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Obx(
      () => Positioned(
        left: 0,
        right: 0,
        top: query.height / 1.6 + 20,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: kDefaultDuration),
          offset: steps[controller.selectSteps.value] < 1
              ? const Offset(-1, 0)
              : steps[controller.selectSteps.value] > 3
                  ? const Offset(1, 0)
                  : const Offset(0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3]
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(left: kDefaultPadding),
                    height: 4,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: steps[controller.selectSteps.value] == e
                          ? theme.primaryColor
                          : theme.scaffoldBackgroundColor,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class PhoneInterView extends GetView<OnBoardingController> {
  const PhoneInterView({Key? key, required this.impath, required this.query})
      : super(key: key);

  final String impath;
  final MediaQueryData query;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.topCenter,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: kDefaultDuration),
          margin:
              EdgeInsets.all(steps[controller.selectSteps.value] == 6 ? 0 : 0)
                  .copyWith(
            top: steps[controller.selectSteps.value] == 5 ? 103 : 40,
          ),
          // padding: EdgeInsets.only(bottom: query.viewInsets.bottom),
          width: query.size.width,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: kDefaultDuration),
            opacity: steps[controller.selectSteps.value] == 5 ||
                    steps[controller.selectSteps.value] == 6
                ? 1
                : 0,
            child: Transform.scale(
              scale: steps[controller.selectSteps.value] == 6 ? 1.2 : 1,
              child: Image.asset(
                impath,
                fit: BoxFit.cover,
                // scale: 10,
                //width: query.size.width + 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextViewPhone extends GetView<OnBoardingController> {
  const TextViewPhone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => AnimatedSlide(
        offset: steps[controller.selectSteps.value] > 4
            ? const Offset(0, 0)
            : const Offset(0, 1),
        duration: const Duration(milliseconds: kDefaultDuration),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 32),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "record_phone".tr(),
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Form(
                key: controller.nameForm,
                child: Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: FDTextInput(
                    isPopUpErrorMessage: false,
                    controller: controller.phoneController,
                    isRequired: Validator.required,
                    validator: Validator.phone,
                    topPadding: kDefaultPadding,
                    bottomPadding: kDefaultPadding,
                    leftPadding: 0,
                    rightPadding: kDefaultPadding,
                    textInputType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    borderColor: Colors.transparent,
                    label: "07000000000".tr(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding * 2),
            AnimatedSlide(
              offset: steps[controller.selectSteps.value] == 6
                  ? const Offset(0, 0)
                  : const Offset(0, 0.8),
              duration: const Duration(milliseconds: kDefaultDuration + 100),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Text(
                      "confirmation_code".tr(),
                      style: theme.textTheme.titleMedium,
                    ),
                    const Spacer(),
                    FDButton(
                      isLoading: steps[controller.selectSteps.value] == 6 &&
                          controller.loadingSentOtp.value,
                      title: "resend_code".tr(),
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                          color: theme.primaryColor,
                          decoration: TextDecoration.underline),
                      borderColor: Colors.transparent,
                      isunderLine: true,
                      onPressed: () {
                        if (controller.nameForm.currentState!.validate()) {
                          controller.requestOtpApi(
                              int.parse(controller.phoneController.text),
                              context);
                        }
                      },
                    )
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: OtpView(onSubmit: (a) {}),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OtpView extends GetView<OnBoardingController> {
  const OtpView({Key? key, required this.onSubmit}) : super(key: key);

  final Function(int phoneNumber) onSubmit;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final query = MediaQuery.of(context);
    return AnimatedSlide(
      duration: const Duration(milliseconds: kDefaultDuration),
      offset: steps[controller.selectSteps.value] == 6
          ? const Offset(0, 0)
          : const Offset(0, 1),
      child: Form(
        key: controller.codeForm,
        child: Directionality(
          textDirection: M.TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 55,
                width: 55,
                child: OTPWdiget(
                  autofocus: true && steps[controller.selectSteps.value] == 6,
                  controller: controller.code1Controller,
                  maxLength: 1,
                  borderColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: OTPWdiget(
                  controller: controller.code2Controller,
                  maxLength: 1,
                  borderColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: OTPWdiget(
                  controller: controller.code3Controller,
                  maxLength: 1,
                  borderColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: OTPWdiget(
                  controller: controller.code4Controller,
                  maxLength: 1,
                  borderColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: OTPWdiget(
                  controller: controller.code5Controller,
                  maxLength: 1,
                  borderColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: OTPWdiget(
                  controller: controller.code6Controller,
                  maxLength: 1,
                  borderColor: Colors.transparent,
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextView extends GetView<OnBoardingController> {
  const TextView({
    Key? key,
    required this.query,
    required this.theme,
  }) : super(key: key);

  final Size query;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: steps[controller.selectSteps.value] == 0
          ? const Offset(0, 0)
          : const Offset(1, 0),
      duration: const Duration(milliseconds: kDefaultDuration),
      child: ListTile(
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        title: Text(
          "title".tr(),
          style: theme.textTheme.titleLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("desc".tr()),
            const Divider(),
            Text("desc1".tr()),
          ],
        ),
      ),
    );
  }
}

class TextView1 extends GetView<OnBoardingController> {
  const TextView1({
    Key? key,
    required this.query,
    required this.theme,
  }) : super(key: key);

  final Size query;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: steps[controller.selectSteps.value] == 1
          ? const Offset(0, 0)
          : steps[controller.selectSteps.value] < 1
              ? const Offset(-1, 0)
              : const Offset(1, 0),
      duration: const Duration(milliseconds: kDefaultDuration),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            title: Text(
              "title1".tr(),
              style: theme.textTheme.titleLarge,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("desc2".tr()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextView2 extends GetView<OnBoardingController> {
  const TextView2({
    Key? key,
    required this.query,
    required this.theme,
  }) : super(key: key);

  final Size query;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: steps[controller.selectSteps.value] == 2
          ? const Offset(0, 0)
          : steps[controller.selectSteps.value] < 2
              ? const Offset(-1, 0)
              : const Offset(1, 0),
      duration: const Duration(milliseconds: kDefaultDuration),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            title: Text(
              "title2".tr(),
              style: theme.textTheme.titleLarge,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("desc3".tr()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextView3 extends GetView<OnBoardingController> {
  const TextView3({
    Key? key,
    required this.query,
    required this.theme,
  }) : super(key: key);

  final Size query;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: steps[controller.selectSteps.value] == 3
          ? const Offset(0, 0)
          : steps[controller.selectSteps.value] < 3
              ? const Offset(-1, 0)
              : const Offset(0, -0.35),
      duration: const Duration(milliseconds: kDefaultDuration),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: kDefaultDuration),
        opacity: steps[controller.selectSteps.value] <= 3 ? 1 : 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(kDefaultPadding),
              title: Text(
                "title3".tr(),
                style: theme.textTheme.titleLarge,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("desc4".tr()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
