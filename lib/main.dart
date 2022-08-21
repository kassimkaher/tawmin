import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tamine/controller/information_controller.dart';
import 'package:tamine/controller/on_boarding_controller.dart';
import 'package:tamine/pages/input_information_page.dart';
import 'package:tamine/pages/main_container.dart';

import 'package:tamine/pages/onboarding_pager.dart';

import 'package:flutter/services.dart';

import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tamine/utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ar', 'IQ'),
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        //   fallbackLocale: const Locale('ar', 'IQ'),
        useOnlyLangCode: false,
        child: const App()),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InformationControler());
    final controllerOnboarding = Get.put(OnBoardingController());
    if (controllerOnboarding.begin.value) {
      controllerOnboarding.begin.value = false;
      controllerOnboarding.getToken();
    }
    return MaterialApp(
      title: 'Feed',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('ar', 'IQ'),
      theme: getTheme(context),
      themeMode: ThemeMode.system,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
        ),
        child: MainContainer(),
      ),
    );
  }
}
// controllerOnboarding.otpToken.value != null &&
//                 controllerOnboarding.otpToken.value.isNotEmpty
//             ? InputInformationPage()
//             :